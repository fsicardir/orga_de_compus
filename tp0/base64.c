#include "./base64.h"
#include <assert.h>

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

static void octets_to_sextets(const unsigned char octets[3], unsigned char sextets[4]) {
    sextets[0] = base64_encoding[octets[0] >> 2];
    sextets[1] = base64_encoding[((octets[0] & 0x03) << 4) | (octets[1] >> 4)];
    sextets[2] = base64_encoding[((octets[1] & 0x0f) << 2) | (octets[2] >> 6)];
    sextets[3] = base64_encoding[octets[2] & 0x3f];
}

unsigned char *base64_encode(const unsigned char *input, size_t input_size) {
    size_t output_size = input_size * 4 / 3 + 5;

    unsigned char *output = malloc(sizeof(char) * output_size);
    if (output == NULL)
        return NULL;

    size_t in_index = 0;
    size_t out_index = 0;

    while (input_size - in_index >= 3) {
        octets_to_sextets(input + in_index, output + out_index);
        in_index += 3;
        out_index += 4;
    }
    char remaining_octets = input_size - in_index;
    if (remaining_octets > 0) {
        unsigned char last_octets[] = {
            input[in_index],
            (remaining_octets == 2) ? input[in_index + 1] : 0,
            0
        };
        octets_to_sextets(last_octets, output + out_index);
        output[out_index + 3] = PADDING_CHAR;
        if (remaining_octets == 1)
            output[out_index + 2] = PADDING_CHAR;
    }
    
    output[out_index + ((remaining_octets > 0) ? 4 : 0)] = 0;
    return output;
}

static void sextets_to_octets(const unsigned char sextets[4], unsigned char octets[3]) {
    octets[0] = sextets[0] << 2 | sextets[1] >> 4;
    octets[1] = sextets[1] << 4 | sextets[2] >> 2;
    octets[2] = sextets[2] << 6 | sextets[3];
}

unsigned char *base64_decode(const unsigned char *input, size_t input_size) {
    for (unsigned char i = 0; i < 64; ++i) {
        base64_decoding[base64_encoding[i]] = i;
    }

    size_t real_size = 0;
    size_t padd_count = 0;
    for (size_t i = 0; i < input_size; ++i) {
        if (base64_decoding[input[i]] == INVALID)
            return NULL;
        if (base64_decoding[input[i]] != WHITESPACE) {
            real_size++;
            if (input[i] == PADDING_CHAR) {
                padd_count++;
                if (padd_count > 2)
                    return NULL;
            } else {
                if (padd_count > 0)
                    return NULL;
            }
        }
    }

    if (real_size == 0 || real_size % 4)
        return NULL;

    size_t output_size = real_size * 3 / 4 + 1;
    unsigned char *output = malloc(output_size * sizeof(unsigned char));
    if (output == NULL)
        return NULL;

    size_t out_index = 0;
    unsigned char sextets[4] = {0};
    size_t current = 0;
    for (size_t i = 0; i < input_size; ++i) {
        if (input[i] == PADDING_CHAR) {

        }
        sextets[current] = base64_decoding[input[i]];
        if (sextets[current] == WHITESPACE)
            continue;
        current++;
        if (current == 4) {
            sextets_to_octets(sextets, output + out_index);
            out_index += 3;
            current = 0;
        }
    }
    output[output_size - 1] = 0;
    return output;
}


int main() {
    unsigned char *encoded_str =
        base64_encode((const unsigned char *)"any carnal pleasure.", 20);
    printf("%s\n", encoded_str);
    free(encoded_str);

    unsigned char *encoded_str1 =
        base64_encode((const unsigned char *)"any carnal pleasure", 19);
    printf("%s\n", encoded_str1);
    free(encoded_str1);

    unsigned char *encoded_str2 =
        base64_encode((const unsigned char *)"any carnal pleasur", 18);
    printf("%s\n", encoded_str2);
    free(encoded_str2);

    unsigned char *encoded_str3 =
        base64_encode((const unsigned char *)"any carnal pleasu", 17);
    printf("%s\n", encoded_str3);
    free(encoded_str3);

    unsigned char *encoded_str4 =
        base64_encode((const unsigned char *)"any carnal pleas", 16);
    printf("%s\n", encoded_str4);
    free(encoded_str4);

    unsigned char *decoded_str3 =
        base64_decode((const unsigned char *)"YW55IGN hcm5hbCBwbGVhc3VyZS4= ", 30);
    printf("%s\n", decoded_str3);
    free(decoded_str3);

    unsigned char *decoded_str4 =
        base64_decode((const unsigned char *)"YW55IGNhcm5hbCBwbGVhc3VyZQ==", 28);
    printf("%s\n", decoded_str4);
    free(decoded_str4);

    unsigned char *decoded_str =
        base64_decode((const unsigned char *)"YW\t55IGNhcm5\nhbCBwb GVhc3Vy", 27);
    printf("%s\n", decoded_str);
    free(decoded_str);

    unsigned char *decoded_str1 =
        base64_decode((const unsigned char *)"YW55IGNhcm5hbCBwbGVhc3U=", 24);
    printf("%s\n", decoded_str1);
    free(decoded_str1);

    unsigned char *decoded_str2 =
        base64_decode((const unsigned char *)"YW55IGNhcm5hbCBwbGVhcw==", 24);
    printf("%s\n", decoded_str2);
    free(decoded_str2);

    assert(base64_decode((const unsigned char *)"YW55IGNhcm5hbCBwbGVhcw===", 25) == NULL);
    assert(base64_decode((const unsigned char *)"YW=55IGNhcm5hbCBwbGVhcw==", 25) == NULL);

    return 0;
}
