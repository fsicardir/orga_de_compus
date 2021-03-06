#include <stdio.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdlib.h>
#include <errno.h>
#include <memory.h>
#include <limits.h>
#include "mcd.h"
#include "mcm.h"

#define VERSION "v0.1.0"
#define OK 0
#define ERROR 1
#define MININT 2

static void print_version() {
    printf("%s\n", VERSION);
}

static void print_help() {
    printf("Usage:\n"
           "   common -h\n"
           "   common -V\n"
           "   common [options] M N\n"
           "Options:\n"
           "   -h, --help Prints usage information.\n"
           "   -V, --version Prints version information.\n"
           "   -o, --output Path to output file.\n"
           "   -d, --divisor Just the divisor.\n"
           "   -m, --multiple Just the multiple.\n"
           "Examples:\n"
           "   common -o - 256 192\n"
    );
}

static void write_value(FILE *wfp, unsigned int value) {
    fprintf(wfp, "%u\n", value);
}

static unsigned int get_number(char *const s) {
    char *p;
    unsigned long conv = strtoul(s, &p, 10);

    if (errno != 0 || *p != '\0' || conv < MININT || conv > INT_MAX) {
        fprintf(stderr, "Error: arguments should be numbers between %d and %d.\n", MININT, INT_MAX);
        return 0;
    }

    return conv;
}

int main (int argc, char *const *argv) {
    static struct option long_options[] = {
            {"help", no_argument, NULL, 'h'},
            {"version", no_argument, NULL, 'V'},
            {"output", required_argument, NULL, 'o'},
            {"divisor", no_argument, NULL, 'd'},
            {"multiple", no_argument, NULL, 'm'},
            {NULL, 0, NULL, 0}
    };
    const char * const short_opts = "hVo:dm";

    FILE* wfp = stdout;
    bool calculate_mcd = true;
    bool calculate_mcm = true;
    unsigned int m;
    unsigned int n;
    int opt;

    while ((opt = getopt_long(argc, argv, short_opts, long_options, NULL)) != -1) {
        switch (opt) {
            case 'V':
                print_version();
                return OK;
            case 'h':
                print_help();
                return OK;
            case 'o':
                if (strcmp(optarg, "-") == 0) {
                    continue;
                }
                wfp = fopen(optarg, "w");
                if (!wfp) {
                    fprintf(stderr, "Error: could not write to file '%s'.\n", optarg);
                    return ERROR;
                }
                continue;
            case 'd':
                calculate_mcm = false;
                break;
            case 'm':
                calculate_mcd = false;
                break;
            default:
                if(wfp != NULL)
                    fclose(wfp);
                return ERROR;
        }
    }

    if (optind + 2 != argc) {
        fprintf(stderr, "Error: expected two numbers after options.\n");
        fclose(wfp);
        return ERROR;
    }

    m = get_number(argv[optind]);
    n = get_number(argv[optind + 1]);

    if (m == 0 || n == 0) {
        fclose(wfp);
        return ERROR;
    }

    if (calculate_mcd) {
        write_value(wfp, mcd(m, n));
    }

    if (calculate_mcm) {
        unsigned long long mult = (unsigned long long)m * n;
        if (mult > UINT_MAX) {
            fprintf(stderr, "Error: calculation produces overflow.\n");
            fclose(wfp);
            return ERROR;
        }
        write_value(wfp, mcm(m, n));
    }

    fclose(wfp);

    return OK;
}
