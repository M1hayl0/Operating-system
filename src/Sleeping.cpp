#include "../h/Sleeping.hpp"

Sleeping::Elem* Sleeping::head = nullptr;

void Sleeping::get() {
    if(!head) return;
    head->time--;
    if(!head->time) {
        Elem *cur = head;
        while(cur) {
            if(!cur->time) {
                Scheduler::put(cur->thread);
                cur->thread->setSleeping(false);
                Elem *f = cur;
                cur = cur->next;
                delete f;
            } else {
                head = cur;
                break;
            }
        }
        if(!cur) head = cur;
    }
}

void Sleeping::put(TCB *t, time_t time) {
    Elem *newElem = new Elem(t, nullptr, time);

    if(!head) { head = newElem; }
    else {
        Elem *cur = head, *prev = nullptr;
        for(; cur; cur = cur->next) {
            if(newElem->time >= cur->time) {
                newElem->time -= cur->time;
            } else break;
            prev = cur;
        }
        if(prev) prev->next = newElem;
        newElem->next = cur;
        if(!prev) head = newElem;
        if(cur) {
            if(prev) cur->time -= newElem->time - prev->time;
            else cur->time -= newElem->time;
        }
    }
}


