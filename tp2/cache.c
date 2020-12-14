#include "cache.h"
#include <string.h>

struct cache_block {
    unsigned int tag;
    bool is_valid;
    bool is_dirty;
    unsigned int lru_count;
    unsigned char *data;
};

static void cache_block_create(cache_block_t *cache_block, unsigned char* data) {
    cache_block->tag = 0;
    cache_block->is_valid = false;
    cache_block->is_dirty = false;
    cache_block->lru_count = 0;
    cache_block->data = data;
}

bool cache_create(cache_t *cache, unsigned int ways_number, unsigned int sets_number, unsigned int block_size, unsigned char *main_memory) {
    cache->miss_count = 0;
    cache->hit_count = 0;
    cache->ways_number = ways_number;
    cache->sets_number = sets_number;
    cache->block_size = block_size;
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
        cache_block_create(block, data);
    }
    cache->main_memory = main_memory;
    return true;
}

void cache_destroy(cache_t *cache) {
    free(cache->blocks);
    free(cache->data);
}

static cache_block_t *cache_get_block(cache_t *cache, 
        unsigned int way_number, unsigned int set_number) {
    return cache->blocks + (set_number * cache->sets_number + way_number);
}

unsigned int cache_find_set(cache_t *cache, int address) {
    return (address / cache->block_size) % cache->sets_number;
}

unsigned int cache_find_lru(cache_t *cache, unsigned int set_number) {
    cache_block_t *cache_block;
    unsigned int max = 0;
    int lru_i = 0;
    for (unsigned int way_number = 0; way_number < cache->ways_number; ++way_number) {
        cache_block = cache_get_block(cache, way_number, set_number);
        if (cache_block->lru_count > max) {
            max = cache_block->lru_count;
            lru_i = way_number;
        }
    }
    return lru_i;
}

bool cache_is_dirty(cache_t *cache, unsigned int way_number, unsigned int set_number) {
    return cache_get_block(cache, way_number, set_number)->is_dirty;
}

static unsigned int cache_find_tag(cache_t *cache, unsigned int block_number) {
    return block_number >> (cache->sets_number);
}

void cache_read_block(cache_t *cache, unsigned int block_number) {
    unsigned int block_size = cache->block_size;
    unsigned int set_number = cache_find_set(cache, block_number * block_size);
    unsigned int way_number = cache_find_lru(cache, set_number);
    cache_block_t *block = cache_get_block(cache, way_number, set_number);
    block->tag = cache_find_tag(cache, block_number);
    unsigned char *address = cache->main_memory + (block_number * block_size);
    memcpy(block->data, address, block_size);
}

void cache_write_block(cache_t *cache, unsigned int way_number, unsigned int set_number) {
    cache_block_t *block = cache_get_block(cache, way_number, set_number);
    unsigned int address = ((block->tag << cache->sets_number) & set_number);
    memcpy(cache->main_memory + address, block->data, cache->block_size);
}

static bool cache_hit(cache_t *cache, unsigned int tag, 
        unsigned int set_number, cache_block_t **block) {
    for (unsigned int way_number = 1; way_number < cache->ways_number; ++way_number) {
        *block = cache_get_block(cache, way_number, set_number);
        if ((*block)->is_valid && (*block)->tag == tag) {
            return true;
        }
    }
    return false;
}

static unsigned int cache_find_offset(cache_t *cache, unsigned int address) {
    return address % (cache->block_size);
}

static void cache_update_lru_count(cache_t *cache, unsigned int set_number) {
    for (unsigned int way_number = 1; way_number < cache->ways_number; ++way_number) {
        cache_get_block(cache, way_number, set_number)->lru_count++;
    }
}

unsigned char cache_read_byte(cache_t *cache, unsigned int address) {
    unsigned int block_number = address / cache->block_size;
    unsigned int set_number = cache_find_set(cache, address);
    cache_update_lru_count(cache, set_number);
    unsigned int offset = cache_find_offset(cache, address);
    unsigned int tag = cache_find_tag(cache, block_number);
    cache_block_t *block;
    if (cache_hit(cache, tag, set_number, &block)) {
        cache->hit_count++;
    } else {
        cache->miss_count++;
        unsigned int way_number = cache_find_lru(cache, set_number);
        block = cache_get_block(cache, way_number, set_number);
        if (block->is_valid && block->is_dirty) {
            cache_write_block(cache, way_number, set_number);
        }
        cache_read_block(cache, block_number);
        block->is_dirty = false;
        block->is_valid = true;
    }
    block->lru_count = 0;
    return block->data[offset];
}

void cache_write_byte(cache_t *cache, unsigned int address, unsigned char value) {
    unsigned int block_number = address / cache->block_size;
    unsigned int set_number = cache_find_set(cache, address);
    cache_update_lru_count(cache, set_number);
    unsigned int offset = cache_find_offset(cache, address);
    unsigned int tag = cache_find_tag(cache, block_number);
    cache_block_t *block;
    if (cache_hit(cache, tag, set_number, &block)) {
        cache->hit_count++;
    } else {
        cache->miss_count++;
        unsigned int way_number = cache_find_lru(cache, set_number);
        block = cache_get_block(cache, way_number, set_number);
        if (block->is_valid && block->is_dirty) {
            cache_write_block(cache, way_number, set_number);
        }
        cache_read_block(cache, block_number);
        block->is_valid = true;
    }
    block->is_dirty = true;
    block->lru_count = 0;
    block->data[offset] = value;
}

unsigned int cache_get_miss_rate(cache_t *cache) {
    return (cache->miss_count * 100) / (cache->miss_count + cache->hit_count);
}
