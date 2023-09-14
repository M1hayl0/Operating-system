#ifndef PROJECT_BASE_SYSCALL_C_HPP
#define PROJECT_BASE_SYSCALL_C_HPP

#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"
#include "../h/Sem.hpp"
#include "../h/Cons.hpp"

enum codes {
    MEM_ALLOC_CODE = 0x01,
    MEM_FREE_CODE = 0x02,
    THREAD_CREATE_CODE = 0x11,
    THREAD_EXIT_CODE = 0x12,
    THREAD_DISPATCH_CODE = 0x13,
    THREAD_JOIN_CODE = 0x14,
    SEM_OPEN_CODE = 0x21,
    SEM_CLOSE_CODE = 0x22,
    SEM_WAIT_CODE = 0x23,
    SEM_SIGNAL_CODE = 0x24,
    SLEEP_CODE = 0x31,
    CONSOLE_GETC_CODE = 0x41,
    CONSOLE_PUTC_CODE = 0x42
};

void *mem_alloc(uint64 size);
int mem_free(void*);

class TCB;
typedef TCB* thread_t;
int thread_create(TCB **handle, void(*start_routine)(void*), void *arg);
int thread_exit();
void thread_dispatch();
void thread_join(TCB *handle);

class Sem;
typedef Sem* sem_t;
int sem_open(Sem **handle, unsigned init);
int sem_close(Sem *handle);
int sem_wait(Sem *id);
int sem_signal(Sem *id);

typedef unsigned long time_t;
int time_sleep(time_t time);
const int EOF = -1;
char getc();
void putc(char);

#endif //PROJECT_BASE_SYSCALL_C_HPP
