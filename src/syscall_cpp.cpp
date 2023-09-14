#include "../h/syscall_cpp.hpp"

void *operator new(uint64 size){
    return mem_alloc(size);
}

void *operator new[](uint64 n) {
    return mem_alloc(n);
}

void operator delete(void *adress) noexcept {
    mem_free(adress);
}

void operator delete[](void *adress) noexcept {
    mem_free(adress);
}

Thread::Thread(void (*body)(void *), void *arg) {
    this->body = body;
    this->arg = arg;
}

Thread::Thread() {
    this->body = Thread::wrapper;
    this->arg = this;
}

void Thread::wrapper(void *t) {
    ((Thread*) t)->run();
}

Thread::~Thread() {
    myHandle->setFinished(true);
    delete myHandle;
}

int Thread::start() {
    thread_create(&myHandle , body, arg);
    return 0;
}

void Thread::join() {
    thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}


Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}


void PeriodicThread::run() {
    while(period) {
        periodicActivation();
        time_sleep(period);
    }
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
