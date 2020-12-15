#include "cache.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define MAIN_MEMORY_SIZE (64 * 1024)
#define RANDOM_RUNS 1000000

static unsigned char main_memory[MAIN_MEMORY_SIZE] = { 0 };
static cache_t cache;

static void test_case_1() {
    unsigned int ways_count = 4;
    unsigned int sets_count = 32;
    unsigned int block_size = 32;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 255);
    cache_write_byte(&cache, 16384, 254);
    cache_write_byte(&cache, 32768, 248);
    cache_write_byte(&cache, 49152, 96);

    cache_read_byte(&cache, 0);
    cache_read_byte(&cache, 16384);
    cache_read_byte(&cache, 32768);
    cache_read_byte(&cache, 49152);

    assert(cache_get_miss_rate(&cache) == 50);

    cache_destroy(&cache);

    printf("Test case 1...\tOK\n");
}

static void test_case_2() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 255);
    cache_write_byte(&cache, 16384, 254);
    cache_write_byte(&cache, 32768, 248);
    cache_write_byte(&cache, 49152, 96);

    cache_read_byte(&cache, 0);
    cache_read_byte(&cache, 16384);
    cache_read_byte(&cache, 32768);
    cache_read_byte(&cache, 49152);

    assert(cache_get_miss_rate(&cache) == 100);

    cache_destroy(&cache);

    printf("Test case 2...\tOK\n");
}

static void test_case_3() {
    unsigned int ways_count = 4;
    unsigned int sets_count = 32;
    unsigned int block_size = 32;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 123);
    cache_write_byte(&cache, 1024, 234);
    cache_write_byte(&cache, 2048, 33);
    cache_write_byte(&cache, 3072, 44);
    cache_write_byte(&cache, 4096, 55);

    cache_read_byte(&cache, 0);
    cache_read_byte(&cache, 1024);
    cache_read_byte(&cache, 2048);
    cache_read_byte(&cache, 3072);
    cache_read_byte(&cache, 4096);

    assert(cache_get_miss_rate(&cache) == 100);

    cache_destroy(&cache);

    printf("Test case 3...\tOK\n");
}

static void test_case_4() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 123);
    cache_write_byte(&cache, 1024, 234);
    cache_write_byte(&cache, 2048, 33);
    cache_write_byte(&cache, 3072, 44);
    cache_write_byte(&cache, 4096, 55);

    cache_read_byte(&cache, 0);
    cache_read_byte(&cache, 1024);
    cache_read_byte(&cache, 2048);
    cache_read_byte(&cache, 3072);
    cache_read_byte(&cache, 4096);

    assert(cache_get_miss_rate(&cache) == 50);

    cache_destroy(&cache);

    printf("Test case 4...\tOK\n");
}

static void test_uses_same_block() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 123);
    cache_write_byte(&cache, 1, 234);
    cache_write_byte(&cache, 2, 33);
    cache_write_byte(&cache, 3, 44);
    cache_write_byte(&cache, 4, 55);

    cache_read_byte(&cache, 0);
    cache_read_byte(&cache, 1);
    cache_read_byte(&cache, 2);
    cache_read_byte(&cache, 3);
    cache_read_byte(&cache, 4);

    assert(cache_get_miss_rate(&cache) == 10);

    cache_destroy(&cache);

    printf("Uses same block...\tOK\n");
}

static void test_uses_all_ways_of_set() {
    unsigned int ways_count = 4;
    unsigned int sets_count = 32;
    unsigned int block_size = 32;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 255);
    assert(cache_is_dirty(&cache, 0, 0));
    cache_write_byte(&cache, 16384, 254);
    assert(cache_is_dirty(&cache, 1, 0));
    cache_write_byte(&cache, 32768, 248);
    assert(cache_is_dirty(&cache, 2, 0));
    cache_write_byte(&cache, 49152, 96);
    assert(cache_is_dirty(&cache, 3, 0));

    assert(cache_get_miss_rate(&cache) == 100);

    assert(cache_read_byte(&cache, 0) == 255);
    assert(cache_is_dirty(&cache, 0, 0));
    assert(cache_read_byte(&cache, 16384) == 254);
    assert(cache_is_dirty(&cache, 1, 0));
    assert(cache_read_byte(&cache, 32768) == 248);
    assert(cache_is_dirty(&cache, 2, 0));
    assert(cache_read_byte(&cache, 49152) == 96);
    assert(cache_is_dirty(&cache, 3, 0));

    assert(cache_get_miss_rate(&cache) == 50);

    cache_destroy(&cache);

    printf("Uses all ways of set...\tOK\n");
}

static void test_uses_same_way() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 216, 255);
    assert(cache_is_dirty(&cache, 1, 0));
    cache_write_byte(&cache, 16600, 254);
    assert(cache_is_dirty(&cache, 1, 0));

    assert(cache_read_byte(&cache, 216) == 255);
    assert(!cache_is_dirty(&cache, 1, 0));
    assert(main_memory[216] == 255);
    assert(cache_read_byte(&cache, 16600) == 254);
    assert(main_memory[16600] == 254);
    assert(!cache_is_dirty(&cache, 1, 0));

    assert(cache_get_miss_rate(&cache) == 100);

    cache_destroy(&cache);

    printf("Reuses same way...\tOK\n");
}

static void test_uses_same_tag_different_set() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 255);
    assert(cache_is_dirty(&cache, 0, 0));
    cache_write_byte(&cache, 129, 254);
    assert(cache_is_dirty(&cache, 0, 0));

    assert(cache_read_byte(&cache, 0) == 255);
    assert(cache_is_dirty(&cache, 0, 0));
    assert(cache_read_byte(&cache, 129) == 254);
    assert(cache_is_dirty(&cache, 0, 0));

    assert(cache_get_miss_rate(&cache) == 50);

    cache_destroy(&cache);

    printf("Uses same tag, different set...\tOK\n");
}


static void test_random_reads_and_writes() {

    unsigned int ways_count = 2;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    srand((unsigned long int)&main_memory);
    for (size_t i = 0; i < RANDOM_RUNS; ++i) {
        unsigned int addr = rand() % MAIN_MEMORY_SIZE; 
        unsigned char value = rand();
        cache_write_byte(&cache, addr, value);
        assert(cache_read_byte(&cache, addr) == value);
    }

    cache_destroy(&cache);

    printf("Random reads and writes...\tOK\n");
}

int main() {
    test_case_1();
    test_case_2();
    test_case_3();
    test_case_4();
    test_uses_same_block();
    test_uses_all_ways_of_set();
    test_uses_same_way();
    test_uses_same_tag_different_set();
    test_random_reads_and_writes();
    return 0;
}

