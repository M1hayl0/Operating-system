#ifndef PROJECT_BASE_TCB_HPP
#define PROJECT_BASE_TCB_HPP

#include "../lib/hw.h"
#include "../h/Scheduler.hpp"
#include "../h/Sleeping.hpp"

class TCB {
public:
    friend class Sem;
    using Body = void (*)(void*);

    static int createThread(TCB **handle, Body body, void *arg, void *stack);
    ~TCB();
    static void yield();
    static void dispatch();
    static void join(TCB *handle);
    void waitList();
    static int sleep(time_t time);

    static TCB *running;

    bool isFinished() const { return finished; }
    void setFinished(bool f) { finished = f; }
    bool isJoined() const { return joined; }
    void setJoined(bool b) { joined = b; }
    bool isBlocked() const { return blocked; }
    void setBlocked(bool b) { blocked = b; }
    bool isSleeping() const { return sleeping; }
    void setSleeping(bool b) { sleeping = b; }
    uint64 getTimeSlice() const { return timeSlice; }

    struct Context {
        uint64 sp;
        uint64 ra;
    };

    static uint64 timeSliceCounter;
    static bool userMode;
private:
    Body body;
    void *arg;
    uint64 *stack;
    Context context;
    bool finished = false;
    bool joined = false;
    bool blocked = false;
    bool sleeping = false;
    uint64 timeSlice = DEFAULT_TIME_SLICE;
    bool userModeThread;

    struct Elem {
        TCB *thread;
        Elem *next = nullptr;
        Elem(TCB *p, Elem *n) : thread(p), next(n) {}
    };

    Elem *headWaitList = nullptr;

    TCB(Body b, void *a, void *s);

    static void threadWrapper();
    static void popSppSpie();
};


#endif //PROJECT_BASE_TCB_HPP
