#include <stdlib.h>
#include <stdbool.h>

typedef struct cache_block cache_block_t;

typedef struct cache {
    unsigned char *main_memory;
    int miss_count; 
    int hit_count; 
    int ways_number;
    int sets_number;
    cache_block_t *blocks;
    unsigned char *data;
} cache_t;

bool cache_create(cache_t *cache, int ways_number, int sets_number, 
        unsigned int block_size, unsigned char *main_memory);

void cache_destroy(cache_t *cache);
