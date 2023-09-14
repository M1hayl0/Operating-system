#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"

extern "C" void trap();

extern "C" void ecallHandleTrap() {
    uint64 a0reg, a1reg, a2reg, a3reg, a4reg;
    __asm__ volatile("ld %0 , 10*8(fp)" : "=r" (a0reg));
    __asm__ volatile("ld %0 , 11*8(fp)" : "=r" (a1reg));
    __asm__ volatile("ld %0 , 12*8(fp)" : "=r" (a2reg));
    __asm__ volatile("ld %0 , 13*8(fp)" : "=r" (a3reg));
    __asm__ volatile("ld %0 , 14*8(fp)" : "=r" (a4reg));

    uint64 volatile scause;
    __asm__ volatile ("csrr %0, scause" : "=r" (scause));

    uint64 volatile sepc;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));

    uint64 volatile sstatus;
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));

    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
        sepc += 4;
        uint64 volatile code = a0reg;

        switch (code) {
            case MEM_ALLOC_CODE:
                void *retAlloc;
                uint64 size;
                size = a1reg;
                retAlloc = MemoryAllocator::mem_alloc(size);
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retAlloc));
                break;
            case MEM_FREE_CODE:
                int retFree;
                void *adress;
                adress = (void *) a1reg;
                retFree = MemoryAllocator::mem_free(adress);
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retFree));
                break;
            case THREAD_CREATE_CODE:
                int retThreadCreate;
                TCB **handle;
                handle = (TCB **) a1reg;
                void (*start_routine)(void *);
                start_routine = (void (*)(void *)) a2reg;
                void *arg;
                arg = (void *) a3reg;
                void *stack;
                stack = (void *) a4reg;

                retThreadCreate = TCB::createThread(handle, start_routine, arg, stack);
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retThreadCreate));
                break;
            case THREAD_EXIT_CODE:
                int retThreadExit;
                if (TCB::running->isFinished()) retThreadExit = -1;
                else {
                    TCB::running->setFinished(true);
                    TCB::running->waitList();
                    TCB::dispatch();
                    retThreadExit = 0;
                }
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retThreadExit));
                break;
            case THREAD_DISPATCH_CODE:
                TCB::timeSliceCounter = 0;
                TCB::dispatch();
                break;
            case THREAD_JOIN_CODE:
                TCB *handle2;
                handle2 = (TCB *) a1reg;
                TCB::join(handle2);
                break;
            case SEM_OPEN_CODE:
                Sem **handle3;
                handle3 = (Sem **) a1reg;
                unsigned init;
                init = (unsigned) a2reg;
                Sem::semOpen(handle3, init);
                break;
            case SEM_CLOSE_CODE:
                Sem *handle4;
                handle4 = (Sem *) a1reg;
                Sem::semClose(handle4);
                break;
            case SEM_WAIT_CODE:
                Sem *id1;
                id1 = (Sem *) a1reg;
                Sem::semWait(id1);
                break;
            case SEM_SIGNAL_CODE:
                Sem *id2;
                id2 = (Sem *) a1reg;
                Sem::semSignal(id2);
                break;
            case SLEEP_CODE:
                int retSleep;
                time_t time;
                time = (time_t) a1reg;
                TCB::timeSliceCounter = 0;
                retSleep = TCB::sleep(time);
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (retSleep));
                break;
            case CONSOLE_GETC_CODE:
                char c1;
                c1 = (char) Cons::getcI();
                __asm__ volatile("sd %0, 10*8(fp)" : : "r" (c1));
                break;
            case CONSOLE_PUTC_CODE:
                char c2;
                c2 = (char) a1reg;
                Cons::putcO(c2);
                break;
        }
    } else {
        printInt((int) scause);
    }

    __asm__ volatile ("csrw sepc, %0" : : "r" (sepc));
    __asm__ volatile ("csrw sstatus, %0" : : "r" (sstatus));
}

extern "C" void timerHandleTrap() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %0, scause" : "=r" (scause));

    uint64 volatile sepc;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));

    uint64 volatile sstatus;
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));

    if (scause == 0x8000000000000001UL) {
        int maskSSIP = 1 << 1;
        __asm__ volatile ("csrc sip, %0" : : "r" (maskSSIP));
        TCB::timeSliceCounter++;
        Sleeping::get();
        if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
        }
    }

    __asm__ volatile ("csrw sepc, %0" : : "r" (sepc));
    __asm__ volatile ("csrw sstatus, %0" : : "r" (sstatus));
}

extern "C" void consoleHandleTrap() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %0, scause" : "=r" (scause));

    uint64 volatile sepc;
    __asm__ volatile ("csrr %0, sepc" : "=r" (sepc));

    uint64 volatile sstatus;
    __asm__ volatile ("csrr %0, sstatus" : "=r" (sstatus));

    if (scause == 0x8000000000000009UL) {
        int interupt = plic_claim();
        while(CONSOLE_RX_STATUS_BIT & *((char*)(CONSOLE_STATUS))) {
            char c = (*(char*) CONSOLE_RX_DATA);
            Cons::putcI(c);
        }
        plic_complete(interupt);
    }

    __asm__ volatile ("csrw sepc, %0" : : "r" (sepc));
    __asm__ volatile ("csrw sstatus, %0" : : "r" (sstatus));
}

