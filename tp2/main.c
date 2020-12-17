#include "cache_api.h"
#include <stdio.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdlib.h>
#include <errno.h>
#include <memory.h>
#include <limits.h>

#define VERSION "v0.1.0"
#define OK 0
#define ERROR 1

static void print_version() {
    printf("%s\n", VERSION);
}

static void print_help() {
    printf("Usage:\n"
           "   tp2 -h\n"
           "   tp2 -V\n"
           "   tp2 [options] archivo\n"
           "Options:\n"
           "   -h, --help\tImprime ayuda.\n"
           "   -V, --version\tVersión del programa.\n"
           "   -o, --output\tArchivo de salida.\n"
           "   -w, --ways\tCantidad de vías.\n"
           "   -c, --cachesize\tTamaño del caché en kilobytes.\n"
           "   -b, --blocksize\tTamaño del bloque en bytes.\n"
           "Examples:\n"
           "   tp2 -w 4 -c 8 -b 16 assets/prueba1.mem\n"
    );
}

static unsigned int get_number(char *const s) {
    char *p;
    unsigned long conv = strtoul(s, &p, 10);

    if (errno != 0 || *p != '\0' || conv < 1 || conv > INT_MAX) {
        fprintf(stderr, "Error: arguments should be numbers between %d and %d.\n", 1, INT_MAX);
        return 0;
    }

    return conv;
}

static unsigned int get_power_of_two(char * const s) {
    unsigned int value = get_number(s);
    if (value % 2 != 0) {
        fprintf(stderr, "Error: cache and block sizes should be powers of two.\n");
        return 0;
    }
     return value;
}

int main (int argc, char *const *argv) {
    static struct option long_options[] = {
            {"help", no_argument, NULL, 'h'},
            {"version", no_argument, NULL, 'V'},
            {"output", required_argument, NULL, 'o'},
            {"ways", required_argument, NULL, 'w'},
            {"cachesize", required_argument, NULL, 'c'},
            {"blocksize", required_argument, NULL, 'b'},
            {NULL, 0, NULL, 0}
    };
    const char * const short_opts = "hVo:w:c:b:";

    FILE* output_fd = stdout;
    int opt;
    bool ways_present = false;
    bool cache_size_present = false;
    bool block_size_present = false;

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
                output_fd = fopen(optarg, "w");
                if (!output_fd) {
                    fprintf(stderr, "Error: could not write to file '%s'.\n", optarg);
                    return ERROR;
                }
                continue;
            case 'w':
                ways_number = get_number(optarg);
                ways_present = true;
                break;
            case 'c':
                cache_size = get_power_of_two(optarg);
                cache_size_present = true;
                break;
            case 'b':
                block_size = get_power_of_two(optarg);
                block_size_present = true;
                break;
            default:
                if(output_fd != NULL)
                    fclose(output_fd);
                return ERROR;
        }
    }

    if (!(ways_present && cache_size_present && block_size_present)) {
        fprintf(stderr, "Error: missing mandatory option.\n");
        fclose(output_fd);
        return ERROR;

    }
    if (optind + 1 != argc) {
        fprintf(stderr, "Error: expected file after options.\n");
        fclose(output_fd);
        return ERROR;
    }

    if (ways_number == 0 || cache_size == 0 || block_size == 0) {
        fclose(output_fd);
        return ERROR;
    }

    FILE *input_fd = fopen(argv[optind], "r");
    if (!input_fd) {
        fprintf(stderr, "Error: could not read file '%s'.\n", optarg);
        fclose(output_fd);
        return ERROR;
    }

    init();

    char line[18];
    while (fgets(line, sizeof(line), input_fd)) {
        /* note that fgets don't strip the terminating \n, checking its
           presence would allow to handle lines longer that sizeof(line) */
        printf("%s", line);
    }

    shutdown();

    fclose(output_fd);
    fclose(input_fd);

    return OK;
}

