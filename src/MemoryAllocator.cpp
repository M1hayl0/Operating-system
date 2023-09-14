#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemSegment* MemoryAllocator::freeMemHead;
MemoryAllocator::MemSegment* MemoryAllocator::usedMemHead;
bool MemoryAllocator::initialized = false;

void MemoryAllocator::initialize() {
    freeMemHead = (MemSegment *) HEAP_START_ADDR;
    freeMemHead->next = nullptr;
    freeMemHead->prev = nullptr;
    freeMemHead->size = (uint64) HEAP_END_ADDR - (uint64) HEAP_START_ADDR;
    usedMemHead = nullptr;
}

void *MemoryAllocator::mem_alloc(uint64 size) {
    if(size <= 0) return nullptr;

    size *= MEM_BLOCK_SIZE;

    if(!initialized) {
        initialize();
        initialized = true;
    }

    for(MemSegment *free = freeMemHead; free; free = free->next) {
        if(free->size >= size) {
            //novi iskorisceni segment
            MemSegment *newUsed = free;

            //pokazivac se pomera pa moramo i sve podatke u strukturi da pomerimo
            uint64 s = free->size;
            MemSegment *n = free->next;
            MemSegment *p = free->prev;
            if(s - size) {
                if(freeMemHead == free) freeMemHead = (MemSegment *)((char *)free + size);
                free = (MemSegment *)((char *)free + size);
                free->size = s - size;
                free->next = n;
                free->prev = p;
                if(free->next) free->next->prev = free;
                if(free->prev) free->prev->next = free;
            } else {
                if (!free->prev && !free->next) {
                    freeMemHead = nullptr;
                } else if(!free->prev) {
                    freeMemHead = free->next;
                    freeMemHead->prev = nullptr;
                } else if(!free->next) {
                    free->prev->next = nullptr;
                } else {
                    free->prev->next = free->next;
                    free->next->prev = free->prev;
                }
            }

            newUsed->size = size;
            if(!usedMemHead) {
                usedMemHead = newUsed;
                usedMemHead->next = nullptr;
                usedMemHead->prev = nullptr;
            } else {
                //ulancavanje newUsed u listu
                for(MemSegment *used = usedMemHead; used; used = used->next) {
                    if(!used->next && used < newUsed) {
                        //dodavanje na kraj liste
                        used->next = newUsed;
                        newUsed->prev = used;
                        newUsed->next = nullptr;
                        break;
                    } else if(used > newUsed) {
                        //ubaciti newUsed izmedju used->prev i used
                        if(used == usedMemHead) {
                            newUsed->prev = nullptr;
                            newUsed->next = used;
                            used->prev = newUsed;
                            usedMemHead = newUsed;
                        } else {
                            newUsed->prev = used->prev;
                            newUsed->next = used;
                            if(newUsed->prev) newUsed->prev->next = newUsed;
                            if(newUsed->next) newUsed->next->prev = newUsed;
                        }
                        break;
                    }
                }
            }
            return (char *)newUsed + sizeof(MemoryAllocator::MemSegment);
        }
    }
    return nullptr;
}

int MemoryAllocator::mem_free(void *adress) {
    if(!adress) return -1;
    adress = (char *)adress - sizeof(MemoryAllocator::MemSegment);

    for(MemSegment *used = usedMemHead; used; used = used->next) {
        if(used == adress) {
            //novi slobodan segment
            MemSegment *newFree = used;

            //izbaciti used iz liste
            if (!used->prev && !used->next) {
                usedMemHead = nullptr;
            } else if(!used->prev) {
                usedMemHead = used->next;
                usedMemHead->prev = nullptr;
                used->next = nullptr;
            } else if(!used->next) {
                used->prev->next = nullptr;
                used->prev = nullptr;
            } else {
                used->prev->next = used->next;
                used->next->prev = used->prev;
                used->prev = nullptr;
                used->next = nullptr;
            }

            //ulancavanje newFree u listu
            for(MemSegment *free = freeMemHead; free; free = free->next) {
                if(free > newFree) {
                    //ubaciti newFree izmedju free->prev i free
                    if(free == freeMemHead) {
                        newFree->prev = nullptr;
                        newFree->next = free;
                        free->prev = newFree;
                        freeMemHead = newFree;
                    } else {
                        newFree->prev = free->prev;
                        newFree->next = free;
                        newFree->prev->next = newFree;
                        newFree->next->prev = newFree;
                    }

                    //spajanje slobodnih segmenata
                    MemSegment *cur = newFree;
                    if(cur->next && (char *)cur + cur->size == (char *)cur->next) {
                        cur->size += cur->next->size;
                        cur->next = cur->next->next;
                        if(cur->next) cur->next->prev = cur;
                    }

                    if(newFree->prev) {
                        cur = newFree->prev;
                        if(cur->next && (char *)cur + cur->size == (char *)cur->next) {
                            cur->size += cur->next->size;
                            cur->next = cur->next->next;
                            if(cur->next) cur->next->prev = cur;
                        }
                    }
                    return 0;
                } else if(!free->next) {
                    //dodavanje na kraj liste
                    free->next = newFree;
                    newFree->prev = free;
                    newFree->next = nullptr;

                    //spajanje slobodnih segmenata
                    if(newFree->prev) {
                        MemSegment *cur = newFree->prev;
                        if (cur->next && (char *) cur + cur->size == (char *) cur->next) {
                            cur->size += cur->next->size;
                            cur->next = cur->next->next;
                            if (cur->next) cur->next->prev = cur;
                        }
                    }
                    return 0;
                }
            }
        }
    }

    return -1;
}
