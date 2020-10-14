#include <stdlib.h>
#include <stdio.h>

#define PADDING_CHAR '='

unsigned char *base64_encode(const unsigned char *input, size_t input_size);
unsigned char *base64_decode(const unsigned char *input, size_t input_size);
