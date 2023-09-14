#ifndef PROJECT_BASE_CONS_HPP
#define PROJECT_BASE_CONS_HPP

#include "syscall_cpp.hpp"

class Cons {
    static const unsigned bufferSize = 1000;
    static char inputBuffer[bufferSize];
    static char outputBuffer[bufferSize];
    static uint64 headI, headO, tailI, tailO, countI, countO;
    static Sem *itemAvailableI, *itemAvailableO, *mutexI, *mutexO;
    static bool initialized;
public:
    static void initialize();
    static void dest();
    static char getcI();
    static void putcI(char);
    static char getcO();
    static void putcO(char);
};


#endif //PROJECT_BASE_CONS_HPP
