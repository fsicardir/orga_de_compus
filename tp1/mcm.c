#include "mcm.h"
#include "mcd.h"

unsigned int mcm(unsigned int m, unsigned int n) {
    return n * m / mcd(n, m);
}

