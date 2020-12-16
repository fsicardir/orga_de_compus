#ifndef CACHE_API_H
#define CACHE_API_H

unsigned int cache_size;
unsigned int block_size;
int ways_number;

void init();

void shutdown();

unsigned int find_set(int address);

unsigned int find_lru(int setnum);

unsigned int is_dirty(int way, int setnum);

void read_block(int blocknum);

void write_block(int way, int setnum);

unsigned char read_byte(int address);

void write_byte(int address, unsigned char value);

int get_miss_rate();

#endif // CACHE_API_H
