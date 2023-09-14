#include "../h/Blocked.hpp"

TCB *Blocked::get() {
    if(!head) return nullptr;
    Elem *elem = head;
    TCB *ret = elem->thread;
    head = head->next;
    if(!head) tail = nullptr;
    delete elem;
    return ret;
}

void Blocked::put(TCB *t) {
    Elem *newElem = new Elem(t, nullptr);
    if(!head) { head = tail = newElem; }
    else {
        tail->next = newElem;
        tail = tail->next;
    }
}
