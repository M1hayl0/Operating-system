#include "../h/syscall_c.hpp"

void syscall(int id, ... ) {
    __asm__ volatile("ecall");
}

void *mem_alloc(uint64 size) {
    size = (size + sizeof(MemoryAllocator::MemSegment) + MEM_BLOCK_SIZE - 1 ) / MEM_BLOCK_SIZE;

    syscall(MEM_ALLOC_CODE, size);

    void *ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

int mem_free(void* adress) {
    syscall(MEM_FREE_CODE, adress);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}


int thread_create(TCB **handle, void(*start_routine)(void*), void *arg) {
    void *stack = (uint64*)(new uint64[DEFAULT_STACK_SIZE]);
    syscall(THREAD_CREATE_CODE, handle, start_routine, arg, stack);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}



int thread_exit() {
    syscall(THREAD_EXIT_CODE);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}

void thread_dispatch() {
    syscall(THREAD_DISPATCH_CODE);
}

void thread_join(TCB *handle) {
    syscall(THREAD_JOIN_CODE, handle);
}

int sem_open (Sem **handle, unsigned init) {
    syscall(SEM_OPEN_CODE, handle, init);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}

int sem_close (Sem *handle) {
    syscall(SEM_CLOSE_CODE, handle);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}

int sem_wait (Sem *id) {
    syscall(SEM_WAIT_CODE, id);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}

int sem_signal (Sem *id) {
    syscall(SEM_SIGNAL_CODE, id);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}


int time_sleep(time_t time) {
    syscall(SLEEP_CODE, time);

    int ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}

char getc() {
    syscall(CONSOLE_GETC_CODE);

    char ret;
    __asm__ volatile("mv a0, %0" : "=r" (ret));
    return ret;
}

void putc(char c) {
    syscall(CONSOLE_PUTC_CODE, c);
}

