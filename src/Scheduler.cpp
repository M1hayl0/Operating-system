#include "../h/Scheduler.hpp"

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

TCB *Scheduler::get() {
    if(!head) return nullptr;
    Elem *elem = head;
    TCB *ret = elem->thread;
    head = head->next;
    if(!head) tail = nullptr;
    delete elem;
    return ret;
}

void Scheduler::put(TCB *t) {
    Elem *newElem = new Elem(t, nullptr);
    if(!head) { head = tail = newElem; }
    else {
        tail->next = newElem;
        tail = tail->next;
    }
}