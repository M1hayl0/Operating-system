#ifndef PROJECT_BASE_BLOCKED_HPP
#define PROJECT_BASE_BLOCKED_HPP

#include "TCB.hpp"

class Blocked {
public:
    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        Elem(TCB *t, Elem *n) : thread(t), next(n) {}
    };

    Elem *head = nullptr;
    Elem *tail = nullptr;

    TCB *get();
    void put(TCB *t);
};



#endif //PROJECT_BASE_BLOCKED_HPP
