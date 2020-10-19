#include "base64.h"

#define INVALID 128

static const unsigned char base64_encoding[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static unsigned char base64_decoding[256] = {
        INVALID,
        [PADDING_CHAR] = 0,
};

void octets_to_sextets(unsigned const char octets[3], unsigned char sextets[4], int missing_octets) {
    sextets[0] = base64_encoding[octets[0] >> 2];
    sextets[1] = base64_encoding[((octets[0] & 0x03) << 4) | (octets[1] >> 4)];
    sextets[2] = base64_encoding[((octets[1] & 0x0f) << 2) | (octets[2] >> 6)];
    sextets[3] = base64_encoding[octets[2] & 0x3f];

    if (missing_octets >= 1) sextets[3] = PADDING_CHAR;
    if (missing_octets == 2) sextets[2] = PADDING_CHAR;
}

int sextets_to_octets(unsigned const char sextets[4], unsigned char octets[3]) {
    octets[0] = base64_decoding[sextets[0]] << 2 | base64_decoding[sextets[1]] >> 4;
    octets[1] = base64_decoding[sextets[1]] << 4 | base64_decoding[sextets[2]] >> 2;
    octets[2] = base64_decoding[sextets[2]] << 6 | base64_decoding[sextets[3]];

    if (sextets[2] == PADDING_CHAR) return 1;
    if (sextets[3] == PADDING_CHAR) return 2;
    return 3;
}

void build_base64_decoding() {
    for (unsigned char i = 0; i < 64; ++i) {
        base64_decoding[base64_encoding[i]] = i;
    }
}

void write_file(FILE* wfp, unsigned char* output, int size) {
    for (int i=0; i < size; i++) {
        fputc(output[i], wfp);
    }
}

void base64_encode_file(FILE *fp, FILE* wfp) {
    unsigned char to_encode[3];
    unsigned char encoded[4];
    int read_c;
    int octets_count = 0;

    while ((read_c = fgetc(fp)) != EOF) {
        to_encode[octets_count++] = read_c;
        if (octets_count == 3) {
            octets_to_sextets(to_encode, encoded, 0);
            write_file(wfp, encoded, 4);
            octets_count = 0;
        }
    }

    if (octets_count > 0) {
        if (octets_count == 1) to_encode[1] = 0u;
        if (octets_count <= 2) to_encode[2] = 0u;
        octets_to_sextets(to_encode, encoded, 3 - octets_count);
        write_file(wfp, encoded, 4);
    }
}

void base64_decode_file(FILE *fp, FILE* wfp) {
    unsigned char to_decode[4];
    unsigned char decoded[3];
    int read_c;
    int sextets_count = 0;

    build_base64_decoding();

    while ((read_c = fgetc(fp)) != EOF) {
        if (base64_decoding[(unsigned char) read_c] > 63) {
            fprintf(stderr, "Bad encoding: invalid characters\n");
            return;
        }

        to_decode[sextets_count++] = read_c;
        if (sextets_count == 4) {
            write_file(wfp, decoded, sextets_to_octets(to_decode, decoded));
            sextets_count = 0;
        }
    }

    if (sextets_count != 0) {
        fprintf(stderr, "Bad encoding: missing characters\n");
    }
}
