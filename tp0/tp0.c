#include <getopt.h>
#include <stdbool.h>
#include "base64.h"

#define VERSION "v0.1.0"
#define OK 0
#define ERROR 1

void print_version() {
    printf("%s\n", VERSION);
}

void print_help() {
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
            case 'V':
                print_version();
                return OK;
            case 'h':
                print_help();
                return OK;
            case 'o':
                wfp = fopen(optarg, "w");
                if (!wfp) {
                    fprintf(stderr, "File not found \n");
                    return ERROR;
                }
                continue;
            case 'i':
                fp = fopen(optarg, "r");
                if (!fp) {
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
        base64_encode_file(fp, wfp);
    } else {
        base64_decode_file(fp, wfp);
    }

    fclose(fp);
    fclose(wfp);

    return OK;
}
