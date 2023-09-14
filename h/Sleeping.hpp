#ifndef PROJECT_BASE_SLEEPING_HPP
#define PROJECT_BASE_SLEEPING_HPP

#include "../h/TCB.hpp"

class TCB;

class Sleeping {
    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        time_t time;
        Elem(TCB *t, Elem *n, time_t tm) : thread(t), next(n), time(tm) {}
    };

    static Elem *head;

public:
    static void get();
    static void put(TCB *t, time_t time);

};


#endif //PROJECT_BASE_SLEEPING_HPP
