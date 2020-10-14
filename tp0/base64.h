#include <stdlib.h>
#include <stdio.h>

#define PADDING_CHAR '='

/*
 * Encodes the given array to base64, returning a NULL terminated string
 * On error returns NULL.
 */
unsigned char *base64_encode(const unsigned char *input, size_t input_size);

/*
 * Decodes the given array from base64, returning a NULL terminated string
 * Returns NULL if the given array is invalid.
 */
unsigned char *base64_decode(const unsigned char *input, size_t input_size);
