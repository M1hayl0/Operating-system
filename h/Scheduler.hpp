#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP

#include "../h/TCB.hpp"

class TCB;

class Scheduler {
    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        Elem(TCB *p, Elem *n) : thread(p), next(n) {}
    };

    static Elem *head;
    static Elem *tail;

public:
    static TCB *get();
    static void put(TCB *t);
};


#endif //PROJECT_BASE_SCHEDULER_HPP