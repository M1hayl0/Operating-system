#include "../h/Sem.hpp"
#include "../h/syscall_c.hpp"

int Sem::semOpen(Sem **handle, unsigned int init) {
    *handle = new Sem((int) init);
    if(!*handle) return -1;
    return 0;
}

int Sem::semClose(Sem *handle) {
    if(!handle) return -1;
    while(handle->blockedThreads->head) handle->deblock();
    delete handle;
    return 0;
}

int Sem::semWait(Sem *id) {
    if(!id) return -1;
    if(--id->init < 0) id->block();
    return 0;
}

int Sem::semSignal(Sem *id) {
    if(!id) return -1;
    if(++id->init <= 0) id->deblock();
    return 0;
}

void Sem::block() {
    TCB::running->setBlocked(true);
    blockedThreads->put(TCB::running);
    TCB::yield();
}

void Sem::deblock() {
    TCB *p = blockedThreads->get();
    p->setBlocked(false);
    Scheduler::put(p);
}
