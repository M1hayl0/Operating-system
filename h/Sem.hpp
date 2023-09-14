#ifndef PROJECT_BASE_SEM_HPP
#define PROJECT_BASE_SEM_HPP

#include "Blocked.hpp"
#include "TCB.hpp"

class Sem {
    int init;
    Blocked *blockedThreads = new Blocked();

public:
    friend class TCB;

    Sem(int i) : init(i) { }

    static int semOpen(Sem **handle, unsigned init);
    static int semClose(Sem *handle);
    static int semWait(Sem *id);
    static int semSignal(Sem *id);

    void block();
    void deblock();

};

#endif //PROJECT_BASE_SEM_HPP
