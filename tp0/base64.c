#include "base64.h"

#define INVALID 128
#define WHITESPACE 129

static const unsigned char base64_encoding[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static unsigned char base64_decoding[256] = {
        INVALID,
        [' '] = WHITESPACE,
        ['\n'] = WHITESPACE,
        ['\r'] = WHITESPACE,
        ['\t'] = WHITESPACE,
        [PADDING_CHAR] = 0,
};

void base64_encode(unsigned const char octets[3], unsigned char sextets[4], int missing_octets) {
    sextets[0] = base64_encoding[octets[0] >> 2];
    sextets[1] = base64_encoding[((octets[0] & 0x03) << 4) | (octets[1] >> 4)];
    sextets[2] = base64_encoding[((octets[1] & 0x0f) << 2) | (octets[2] >> 6)];
    sextets[3] = base64_encoding[octets[2] & 0x3f];

    if (missing_octets >= 1) sextets[3] = PADDING_CHAR;
    if (missing_octets == 2) sextets[2] = PADDING_CHAR;
}

void base64_decode(unsigned const char sextets[4], unsigned char octets[3]) {
    for (unsigned char i = 0; i < 64; ++i) {
        base64_decoding[base64_encoding[i]] = i; // TODO: do it once
    }

    octets[0] = base64_decoding[sextets[0]] << 2 | base64_decoding[sextets[1]] >> 4;
    octets[1] = base64_decoding[sextets[1]] << 4 | base64_decoding[sextets[2]] >> 2;
    octets[2] = base64_decoding[sextets[2]] << 6 | base64_decoding[sextets[3]];
}
