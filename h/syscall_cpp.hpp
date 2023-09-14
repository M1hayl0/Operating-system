#ifndef PROJECT_BASE_SYSCALL_CPP_HPP
#define PROJECT_BASE_SYSCALL_CPP_HPP

#include "syscall_c.hpp"

void* operator new(uint64);
void operator delete(void*) noexcept;
void* operator new[](uint64);
void operator delete[](void*) noexcept;


class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread();
    int start();
    void join();
    static void dispatch();
    static void wrapper(void* t);
    static int sleep(time_t time);
protected:
    Thread();
    virtual void run () {}
private:
    TCB *myHandle = nullptr;
    void (*body)(void*);
    void *arg;
};


class Semaphore {
public:
    Semaphore(unsigned init = 1);
    virtual ~Semaphore();
    int wait();
    int signal();
private:
    Sem *myHandle;
};


class PeriodicThread : public Thread {
public:
    void terminate() { period = 0; }
protected:
    PeriodicThread(time_t p) : Thread(), period(p) {}
    virtual void periodicActivation() {}
    void run() override;
private:
    time_t period;
};

class Console {
public:
    static char getc();
    static void putc(char);
};


#endif //PROJECT_BASE_SYSCALL_CPP_HPP
