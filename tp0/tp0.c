#include <stdio.h>
#include <getopt.h>
#include <stdbool.h>
#include "base64.h"

#define VERSION "v0.1.0"
#define OK 0
#define ERROR 1

void write_file(FILE* wfp, unsigned char* output, int size) {
    for (int i=0; i < size; i++) {
        fputc(output[i], wfp);
    }
}

void encode(FILE *fp, FILE* wfp) {
    unsigned char to_encode[3];
    unsigned char encoded[4];
    char read_c;
    int octets_count = 0;

    while ((read_c = fgetc(fp)) != EOF) {
        to_encode[octets_count++] = read_c;
        if (octets_count == 3) {
            base64_encode(to_encode, encoded, 0);
            octets_count = 0;
            write_file(wfp, encoded, 4);
        }
    }

    if (octets_count > 0) {
        if (octets_count == 1) to_encode[1] = 0u;
        if (octets_count <= 2) to_encode[2] = 0u;
        base64_encode(to_encode, encoded, 3 - octets_count);
        write_file(wfp, encoded, 4 - octets_count);
    }
}

void decode(FILE *fp, FILE* wfp) {
    unsigned char to_decode[4];
    unsigned char decoded[3];
    char read_c;
    int sextets_count = 0;

    while ((read_c = fgetc(fp)) != EOF) {
        to_decode[sextets_count++] = read_c;
        if (sextets_count == 4) {
            base64_decode(to_decode, decoded);
            sextets_count = 0;
            write_file(wfp, decoded, 3);
        }
    }

    if (sextets_count != 0) {
        fprintf(stderr, "Bad encoded\n");
    }
}

void print_usage() {
    printf("Usage: \n"
           "   tp0 -h \n"
           "   tp0 -V \n"
           "   tp0 [options] \n"
           "Options: \n"
           "   -V, --version Print version and quit. \n"
           "   -h, --help Print this information. \n"
           "   -o, --output Path to the output file. \n"
           "   -i, --input Path to the input file. \n"
           "   -d, --Decode a base64-encoded file. \n"
           "Examples: \n"
           "   tp0 -i input.txt -o output.txt \n"
    );
}

void print_version() {
    printf("%s\n", VERSION);
}

int main (int argc, char *const *argv) {
    static struct option long_options[] = {
            {"version", no_argument, 0, 'V'},
            {"help", no_argument, 0, 'h'},
            {"output", required_argument, 0, 'o'},
            {"input", required_argument, 0, 'i'},
            {"decode", no_argument, 0, 'd'}
    };
    const char * const short_opts = "Vho:i:d";

    FILE* fp = stdin;
    FILE* wfp = stdout;

    int opt;
    bool is_encode = true;

    while ((opt = getopt_long(argc, argv, short_opts, long_options, NULL)) != -1) {
        switch (opt) {
            case 'h':
                print_usage();
                return OK;
            case 'V':
                print_version();
                return OK;
            case 'i':
                fp = fopen(optarg, "r");
                if (!fp) {
                    fprintf(stderr, "File not found \n");
                    return ERROR;
                }
                continue;
            case 'o':
                wfp = fopen(optarg, "w");
                if (!wfp) {
                    fprintf(stderr, "File not found \n");
                    return ERROR;
                }
                continue;
            case 'd':
                is_encode = false;
                break;
            default:
                fprintf(stderr, "Invalid arguments \n");
                return ERROR;
        }
    }

    if (is_encode) {
        encode(fp, wfp);
    } else {
        decode(fp, wfp);
    }

    fclose(fp);
    fclose(wfp);

    return OK;
}
