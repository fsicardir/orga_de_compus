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

static void cache_init_blocks(cache_t *cache, unsigned int blocks_count) {
    unsigned char *data = cache->data;
    for (unsigned int i = 0; i < blocks_count; ++i) {
        cache_block_t *block = cache->blocks + i;
        cache_block_create(block, data);
        data += cache->block_size;
    }
}

bool cache_create(cache_t *cache, unsigned int ways_count, 
        unsigned int sets_count, unsigned int block_size, 
        unsigned char *main_memory) {
    cache->miss_count = 0;
    cache->hit_count = 0;
    cache->ways_count = ways_count;
    cache->sets_count = sets_count;
    cache->block_size = block_size;
    unsigned int blocks_count = ways_count * sets_count;
    cache->blocks = malloc(sizeof(cache_block_t) * blocks_count);
    if (cache->blocks == NULL) {
        return false;
    }
    cache->data = malloc(blocks_count * block_size);
    if (cache->data == NULL) {
        free(cache->blocks);
        return false;
    }
    cache_init_blocks(cache, blocks_count);
    cache->main_memory = main_memory;
    cache->is_last_op_hit = false;
    return true;
}

void cache_destroy(cache_t *cache) {
    free(cache->blocks);
    free(cache->data);
}

static cache_block_t *cache_find_block(cache_t *cache, 
        unsigned int way_number, unsigned int set_number) {
    return cache->blocks + (set_number * cache->ways_count + way_number);
}

unsigned int cache_find_set(cache_t *cache, unsigned int address) {
    return (address / cache->block_size) % cache->sets_count;
}

unsigned int cache_find_lru(cache_t *cache, unsigned int set_number) {
    cache_block_t *cache_block;
    unsigned int max = 0;
    int lru_i = 0;
    for (unsigned int way_i = 0; way_i < cache->ways_count; ++way_i) {
        cache_block = cache_find_block(cache, way_i, set_number);
        if (cache_block->lru_count > max) {
            max = cache_block->lru_count;
            lru_i = way_i;
        }
    }
    return lru_i;
}

bool cache_is_dirty(cache_t *cache, unsigned int way_number, 
        unsigned int set_number) {
    return cache_find_block(cache, way_number, set_number)->is_dirty;
}

static unsigned int cache_find_tag(cache_t *cache, unsigned int block_number) {
    return block_number / (cache->sets_count);
}

void cache_read_block(cache_t *cache, unsigned int block_number) {
    unsigned int block_size = cache->block_size;
    unsigned int set_number = cache_find_set(cache, block_number * block_size);
    unsigned int way_number = cache_find_lru(cache, set_number);
    cache_block_t *block = cache_find_block(cache, way_number, set_number);
    block->tag = cache_find_tag(cache, block_number);
    unsigned char *address = cache->main_memory + (block_number * block_size);
    memcpy(block->data, address, block_size);
}

void cache_write_block(cache_t *cache, unsigned int way_number, unsigned int set_number) {
    cache_block_t *block = cache_find_block(cache, way_number, set_number);
    unsigned int address = (block->tag * cache->sets_count + set_number) * cache->block_size;
    memcpy(cache->main_memory + address, block->data, cache->block_size);
}

static bool cache_evaluate_hit(cache_t *cache, unsigned int tag, 
        unsigned int set_number, cache_block_t **block) {
    for (unsigned int way_i = 0; way_i < cache->ways_count; ++way_i) {
        *block = cache_find_block(cache, way_i, set_number);
        if ((*block)->is_valid && (*block)->tag == tag) {
            return true;
        }
    }
    return false;
}

static unsigned int cache_find_offset(cache_t *cache, unsigned int address) {
    return address % (cache->block_size);
}

static void cache_update_lru_count(cache_t *cache, unsigned int set_number,
        cache_block_t *used_block) {
    cache_block_t *block;
    for (unsigned int way_i = 0; way_i < cache->ways_count; ++way_i) {
        block = cache_find_block(cache, way_i, set_number);
        if (block == used_block) {
            used_block->lru_count = 0;
        } else {
            block->lru_count++;
        }
    }
}

static cache_block_t *cache_fetch_missing_block(cache_t *cache, 
        unsigned int block_number, unsigned int set_number) {
        unsigned int way_number = cache_find_lru(cache, set_number);
        cache_block_t *block = cache_find_block(cache, way_number, set_number);
        if (block->is_valid && block->is_dirty) {
            cache_write_block(cache, way_number, set_number);
        }
        cache_read_block(cache, block_number);
        block->is_dirty = false;
        block->is_valid = true;
        return block;
}

static cache_block_t *cache_get_block(cache_t *cache, unsigned int address) {
    unsigned int set_number = cache_find_set(cache, address);
    unsigned int block_number = address / cache->block_size;
    unsigned int tag = cache_find_tag(cache, block_number);
    cache_block_t *block;
    if (cache_evaluate_hit(cache, tag, set_number, &block)) {
        cache->hit_count++;
        cache->is_last_op_hit = true;
    } else {
        cache->miss_count++;
        cache->is_last_op_hit = false;
        block = cache_fetch_missing_block(cache, block_number, set_number);
    }
    cache_update_lru_count(cache, set_number, block);
    return block;
}

unsigned char cache_read_byte(cache_t *cache, unsigned int address) {
    unsigned int offset = cache_find_offset(cache, address);
    cache_block_t *block = cache_get_block(cache, address);
    return block->data[offset];
}

void cache_write_byte(cache_t *cache, unsigned int address, unsigned char value) {
    unsigned int offset = cache_find_offset(cache, address);
    cache_block_t *block = cache_get_block(cache, address);
    block->data[offset] = value;
    block->is_dirty = true;
}

unsigned int cache_get_miss_rate(cache_t *cache) {
    return (cache->miss_count * 100) / (cache->miss_count + cache->hit_count);
}

bool cache_is_last_op_hit(cache_t *cache) {
    return cache->is_last_op_hit;
}
