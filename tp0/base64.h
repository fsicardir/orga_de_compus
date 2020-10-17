#ifndef BASE64_BASE64_H
#define BASE64_BASE64_H

#define PADDING_CHAR '='

#include <stdio.h>

/*
 * Encodes the given fp file to base64 and writes the result in the given wfp file.
 */
void base64_encode_file(FILE *fp, FILE* wfp);

/*
 * Decodes the given fp file from base64 and writes the result in the given wfp file.
 */
void base64_decode_file(FILE *fp, FILE* wfp);

#endif //BASE64_BASE64_H
