#include "mcd.h"

unsigned int mcd(unsigned int m, unsigned int n) {
    return (n == 0) ? m : mcd(n, m % n);
}

