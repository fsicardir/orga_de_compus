#include "cache_api.h"
#include "cache.h"


#define MAIN_MEMORY_SIZE (64 * 1024)

unsigned char main_memory[MAIN_MEMORY_SIZE] = { 0 };

cache_t cache;

void init() {
    int sets_number = (cache_size * 1024) / (ways_number * block_size);
    cache_create(&cache, ways_number, sets_number, block_size, main_memory);
}

void shutdown() {
    cache_destroy(&cache);
}
unsigned int find_set(int address) {
    return cache_find_set(&cache, address);
}

unsigned int find_lru(int setnum) {
    return cache_find_lru(&cache, setnum);
}

unsigned int is_dirty(int way, int setnum) {
    return cache_is_dirty(&cache, way, setnum);
}

void read_block(int blocknum) {
    cache_read_block(&cache, blocknum);
}

void write_block(int way, int setnum) {
    cache_write_block(&cache, way, setnum);
}

unsigned char read_byte(int address) {
    return cache_read_byte(&cache, address);
}

void write_byte(int address, unsigned char value) {
    cache_write_byte(&cache, address, value);
}

int get_miss_rate() {
    return cache_get_miss_rate(&cache);
}
