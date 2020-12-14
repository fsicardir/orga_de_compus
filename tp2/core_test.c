#include "cache.h"
#include <assert.h>
#include <stdio.h>

#define MAIN_MEMORY_SIZE (64 * 1024)

unsigned char main_memory[MAIN_MEMORY_SIZE] = { 0 };

static void testcase_1() {
    unsigned int ways_count = 4;
    unsigned int sets_count = 32;
    unsigned int block_size = 32;
    cache_t cache;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 255);
    cache_write_byte(&cache, 16384, 254);
    cache_write_byte(&cache, 32768, 248);
    cache_write_byte(&cache, 49152, 96);

    cache_read_byte(&cache, 0);
    cache_read_byte(&cache, 16384);
    cache_read_byte(&cache, 32768);
    cache_read_byte(&cache, 49152);

    printf("miss rate: %d\n", cache_get_miss_rate(&cache));
    assert(cache_get_miss_rate(&cache) == 50);

    cache_destroy(&cache);

    printf("Test 1 OK!\n");
}

static void testcase_2() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;
    cache_t cache;

    cache_create(&cache, ways_count, sets_count, block_size, main_memory);
    
    cache_write_byte(&cache, 0, 255);
    cache_write_byte(&cache, 16384, 254);
    cache_write_byte(&cache, 32768, 248);
    cache_write_byte(&cache, 49152, 96);

    cache_read_byte(&cache, 0);
    cache_read_byte(&cache, 16384);
    cache_read_byte(&cache, 32768);
    cache_read_byte(&cache, 49152);

    printf("miss rate: %d\n", cache_get_miss_rate(&cache));
    assert(cache_get_miss_rate(&cache) == 100);

    cache_destroy(&cache);

    printf("Test 2 OK!\n");
}

static void testcase_3() {
    unsigned int ways_count = 4;
    unsigned int sets_count = 32;
    unsigned int block_size = 32;
    cache_t cache;

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

    printf("miss rate: %d\n", cache_get_miss_rate(&cache));
    assert(cache_get_miss_rate(&cache) == 100);

    cache_destroy(&cache);

    printf("Test 3 OK!\n");
}

static void testcase_4() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;
    cache_t cache;

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

    printf("miss rate: %d\n", cache_get_miss_rate(&cache));
    assert(cache_get_miss_rate(&cache) == 50);

    cache_destroy(&cache);

    printf("Test 4 OK!\n");
}

static void testcase_5() {
    unsigned int ways_count = 1;
    unsigned int sets_count = 128;
    unsigned int block_size = 128;
    cache_t cache;

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

    printf("miss rate: %d\n", cache_get_miss_rate(&cache));
    assert(cache_get_miss_rate(&cache) == 10);

    cache_destroy(&cache);

    printf("Test 5 OK!\n");
}

int main() {
    testcase_1();
    testcase_2();
    testcase_3();
    testcase_4();
    testcase_5();
    return 0;
}

