#include <sys/regdef.h>

#define SS 12
#define O_RA 8
#define O_GP 4
#define O_FP 0

.text
.align 2

/* 
unsigned int mcm(unsigned int m, unsigned int n) 
*/

.globl mcm
.ent mcm

mcm:
    subu sp, sp, SS
    /* SRA */
    sw ra, O_RA(sp)
    sw gp, O_GP(sp)
    sw fp, O_FP(sp)

    move fp, sp

    mul s0, a0, a1

    jal mcd

    divu s0, v0

    mflo s0

    move v0, s0

    lw fp, O_FP(sp)
    lw gp, O_GP(sp)
    lw ra, O_RA(sp)

    addiu sp, sp, SS
    jr ra

.end mcm
