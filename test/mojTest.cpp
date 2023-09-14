//#include "../h/syscall_cpp.hpp"
//#include "../h/print.hpp"
//
//void A(void *p) {
//    printString("A pocetak\n");
//    printString("A yield\n");
//    TCB::yield();
//    printString("A yield povratak\n");
//    printString("A kraj\n");
//}
//
//class B : public Thread {
//    void run() override {
//        printString("BBB\n");
//    }
//};
//
//struct Sems {
//    Semaphore *s1;
//    Semaphore *s2;
//    Sems(Semaphore *ss1, Semaphore *ss2) : s1(ss1), s2(ss2) {}
//};
//
//void P1(void *p) {
//    int i = 3;
//    Sems *s = (Sems *) p;
//    Semaphore *s1 = s->s1;
//    Semaphore *s2 = s->s2;
//    while(i--) {
//        printString("P1\n");
//        s1->signal();
//        s2->wait();
//    }
//}
//
//void P2(void *p) {
//    int i = 3;
//    Sems *s = (Sems *) p;
//    Semaphore *s1 = s->s1;
//    Semaphore *s2 = s->s2;
//    while(i--) {
//        s1->wait();
//        printString("P2\n");
//        s2->signal();
//    }
//}
//
//
//void userMain() {
//    Thread *t1 = new Thread(A, nullptr);
//    t1->start();
//    TCB::yield();
//    printString("Main nastavak\n");
//
//    Thread *t2 = new B();
//    t2->start();
//
//    t1->join();
//    t2->join();
//    delete t1;
//    delete t2;
//
//    Semaphore *s1 = new Semaphore(0);
//    Semaphore *s2 = new Semaphore(0);
//    Sems *s = new Sems(s1, s2);
//
//    Thread *t3 = new Thread(P1, s);
//    Thread *t4 = new Thread(P2, s);
//    t3->start();
//    t4->start();
//    t3->join();
//    t4->join();
//    delete t3;
//    delete t4;
//    delete s->s1;
//    delete s->s2;
//    delete s;
//
//    while(true) {
//        char c = getc();
//        putc(c);
//        if(c == 'q') break;
//    }
//
//    printString("\nKRAJ\n");
//}
//
//
