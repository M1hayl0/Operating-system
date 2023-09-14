#include "../h/syscall_cpp.hpp"
extern "C" void interruptTable();
extern void userMain();

void output(void *p) {
    while(true) {
        while(CONSOLE_TX_STATUS_BIT & *((char*)(CONSOLE_STATUS))) {
            char c = Cons::getcO();
            *((char*) CONSOLE_TX_DATA) = c;
        }
    }
}

void idle(void *p) {
    while(true){ thread_dispatch(); }
}

bool mainFinished = false;

void userMainWrapper(void *p) {
    userMain();
    mainFinished = true;
}

void main() {
    __asm__ volatile ("csrw stvec, %0" : : "r" ((uint64)&interruptTable + 1));

    TCB *mainHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    TCB::running = mainHandle;
    TCB *idleHandle;
    thread_create(&idleHandle, idle, nullptr);
    TCB *outputHandle;
    thread_create(&outputHandle, output, nullptr);

    TCB::userMode = true;
    TCB *userMainHandle;
    thread_create(&userMainHandle, userMainWrapper, nullptr);

    int maskSSTATUS_SIE = 1 << 1;
    __asm__ volatile ("csrs sstatus, %0" : : "r"(maskSSTATUS_SIE));
    while(!mainFinished) {
        thread_dispatch();
    }
    TCB::userMode = false;

    Cons::dest();
    thread_dispatch();
    delete idleHandle;
    delete userMainHandle;
    delete outputHandle;
    delete mainHandle;
}