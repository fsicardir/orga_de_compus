#include "cache.h"

struct cache_block {
    int tag;
    bool isValid;
    bool isDirty;
    unsigned int lru_count;
    unsigned int block_size;
    unsigned char *data;
};

static void cache_block_create(cache_block_t *cache_block, unsigned int block_size, unsigned char* data) {
    cache_block->tag = 0;
    cache_block->isValid = false;
    cache_block->isDirty = false;
    cache_block->lru_count = 0;
    cache_block->block_size = block_size;
    cache_block->data = data;
}

bool cache_create(cache_t *cache, int ways_number, int sets_number, unsigned int block_size, unsigned char *main_memory) {
    cache->miss_count = 0;
    cache->hit_count = 0;
    cache->ways_number = ways_number;
    cache->sets_number = sets_number;
    int blocks_number = ways_number * sets_number;
    cache->blocks = malloc(sizeof(cache_block_t) * blocks_number);
    if (cache->blocks == NULL) {
        return false;
    }
    cache->data = malloc(blocks_number * block_size);
    if (cache->data == NULL) {
        free(cache->blocks);
        return false;
    }

    unsigned char *data = cache->data;
    for (int i = 0; i < blocks_number; ++i) {
        cache_block_t *block = cache->blocks + i;
        data += block_size;
        cache_block_create(block, block_size, data);
    }
    cache->main_memory = main_memory;
    return true;
}

void cache_destroy(cache_t *cache) {
    free(cache->blocks);
    free(cache->data);
}
