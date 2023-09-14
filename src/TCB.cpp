#include "../h/TCB.hpp"
#include "../h/syscall_c.hpp"

extern "C" void pushRegisters();
extern "C" void popRegisters();
extern "C" void contextSwitch(TCB::Context *oldContext, TCB::Context *runningContext);

TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
bool TCB::userMode = false;

int TCB::createThread(TCB **handle, TCB::Body body, void *arg, void *stack) {
    *handle = new TCB(body, arg, stack);
    if(*handle) return 0;
    else return -1;
}

TCB::TCB(TCB::Body b, void *a, void *s) : body(b), arg(a) {
    if(body) stack = (uint64 *) s;
    else {
        stack = nullptr;
        delete[] (uint64 *) s;
    }
    if(stack) context.sp = (uint64) &stack[DEFAULT_STACK_SIZE];
    else context.sp = 0;
    if(body) context.ra = (uint64) &TCB::threadWrapper;
    else context.ra = 0;
    if(body) Scheduler::put(this);
    userModeThread = userMode;
}

TCB::~TCB() {
    delete[] stack;
    waitList();
}

void TCB::yield() {
    pushRegisters();
    TCB::dispatch();
    popRegisters();
}

void TCB::dispatch() {
    TCB *old = TCB::running;
    if(!old->isFinished() && !old->isJoined() && !old->isBlocked() && !old->isSleeping()) { Scheduler::put(old); }
    TCB::running = Scheduler::get();
    if(old != TCB::running) contextSwitch(&old->context, &TCB::running->context);
}

void TCB::join(TCB *handle) {
    if(handle->isFinished()) return;
    TCB::running->setJoined(true);

    Elem *newElem = new Elem(TCB::running, nullptr);
    if(!handle->headWaitList) { handle->headWaitList = newElem; }
    else {
        newElem->next = handle->headWaitList;
        handle->headWaitList = newElem;
    }

    TCB::yield();
}

void TCB::waitList() {
    Elem *prev;
    while(headWaitList) {
        Scheduler::put(headWaitList->thread);
        headWaitList->thread->setJoined(false);
        prev = headWaitList;
        headWaitList = headWaitList->next;
        delete prev;
    }
}

int TCB::sleep(time_t time) {
    if(!time) return 0;
    Sleeping::put(TCB::running, time);
    TCB::running->setSleeping(true);
    TCB::yield();
    return 0;
}

void TCB::popSppSpie() {
    __asm__ volatile("csrw sepc, ra");
    int maskSPIE = 1 << 5;
    __asm__ volatile("csrs sstatus, %0" : :  "r"(maskSPIE));
    int maskSPP = 1 << 8;
    if(TCB::running->userModeThread) __asm__ volatile("csrc sstatus, %0" : :  "r"(maskSPP));
    else __asm__ volatile("csrs sstatus, %0" : :  "r"(maskSPP));
    __asm__ volatile("sret");
}

void TCB::threadWrapper() {
    TCB::popSppSpie();
    TCB::running->body(TCB::running->arg);
    TCB::running->setFinished(true);
    TCB::running->waitList();
    thread_dispatch();
}
