#include "../h/Cons.hpp"

bool Cons::initialized = false;
uint64 Cons::headI = 0;
uint64 Cons::headO = 0;
uint64 Cons::tailI = 0;
uint64 Cons::tailO = 0;
uint64 Cons::countI = 0;
uint64 Cons::countO = 0;
char Cons::inputBuffer[bufferSize];
char Cons::outputBuffer[bufferSize];
Sem *Cons::itemAvailableI;
Sem *Cons::itemAvailableO;
Sem *Cons::mutexI;
Sem *Cons::mutexO;

void Cons::initialize() {
    sem_open(&Cons::itemAvailableI, 0);
    sem_open(&Cons::itemAvailableO, 0);
    sem_open(&Cons::mutexI, 1);
    sem_open(&Cons::mutexO, 1);
}

void Cons::dest() {
    sem_close(Cons::itemAvailableI);
    sem_close(Cons::itemAvailableO);
    sem_close(Cons::mutexI);
    sem_close(Cons::mutexO);
}


char Cons::getcI() {
    if(!initialized) {
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::itemAvailableI);
    Sem::semWait(Cons::mutexI);
    char c = inputBuffer[headI];
    headI = (headI + 1) % bufferSize;
    countI--;
    Sem::semSignal(Cons::mutexI);
    return c;
}

void Cons::putcI(char c) {
    if(!initialized) {
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::mutexI);
    if (countI < bufferSize) {
        inputBuffer[tailI] = c;
        tailI = (tailI + 1) % bufferSize;
        countI++;
        Sem::semSignal(Cons::itemAvailableI);
    }
    Sem::semSignal(Cons::mutexI);
}

char Cons::getcO() {
    if(!initialized) {
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::itemAvailableO);
    Sem::semWait(Cons::mutexO);
    char c = outputBuffer[headO];
    headO = (headO + 1) % bufferSize;
    countO--;
    Sem::semSignal(Cons::mutexO);
    return c;
}

void Cons::putcO(char c) {
    if(!initialized) {
        initialize();
        initialized = true;
    }
    Sem::semWait(Cons::mutexO);
    if (countO < bufferSize) {
        outputBuffer[tailO] = c;
        tailO = (tailO + 1) % bufferSize;
        countO++;
        Sem::semSignal(Cons::itemAvailableO);
    }
    Sem::semSignal(Cons::mutexO);
}