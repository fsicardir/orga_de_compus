#include <stdlib.h>
#include <stdbool.h>

typedef struct cache_block cache_block_t;

typedef struct cache {
    unsigned char *main_memory;
    unsigned int miss_count; 
    unsigned int hit_count; 
    unsigned int ways_count;
    unsigned int sets_count;
    unsigned int block_size;
    cache_block_t *blocks;
    unsigned char *data;
} cache_t;

bool cache_create(cache_t *cache, unsigned int ways_count, 
        unsigned int sets_count, unsigned int block_size,
        unsigned char *main_memory);

void cache_destroy(cache_t *cache);


unsigned int cache_find_set(cache_t *cache, unsigned int address);

unsigned int cache_find_lru(cache_t *cache, unsigned int set_number);

bool cache_is_dirty(cache_t *cache, unsigned int way_number, unsigned int set_number);

void cache_read_block(cache_t *cache, unsigned int block_number);

void cache_write_block(cache_t *cache, unsigned int way_number, unsigned int set_number);

unsigned char cache_read_byte(cache_t *cache, unsigned int address);

void cache_write_byte(cache_t *cache, unsigned int address, unsigned char value);

unsigned int cache_get_miss_rate(cache_t *cache);
