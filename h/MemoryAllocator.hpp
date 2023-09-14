#ifndef PROJECT_BASE_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"
#include "../lib/mem.h"

class MemoryAllocator {
    MemoryAllocator() = default;
    ~MemoryAllocator() = default;
    static bool initialized;

public:
    struct MemSegment {
        MemSegment* next;
        MemSegment* prev;
        uint64 size;
    };

private:
    static MemSegment *freeMemHead;
    static MemSegment *usedMemHead;

public:
    MemoryAllocator(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;

    static void initialize();

    static void *mem_alloc(uint64 size);
    static int mem_free(void *adress);

};


#endif //PROJECT_BASE_MEMORYALLOCATOR_HPP
