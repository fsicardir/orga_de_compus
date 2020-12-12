#include "cache_api.h"
#include "cache.h"


#define MAIN_MEMORY_SIZE (64 * 1024)

unsigned char main_memory[MAIN_MEMORY_SIZE] = { 0 };

cache_t cache;

void init() {
    int sets_number = (cache_size * 1024) / (ways_number * block_size);
    cache_create(&cache, ways_number, sets_number, block_size, main_memory);
}
