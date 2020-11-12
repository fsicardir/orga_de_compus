#include <sys/regdef.h>

#define SS 32

/* ABA Caller */
#define O_A3 44
#define O_A2 40
#define O_A1 36
#define O_A0 32

/* SRA */
#define O_RA 24
#define O_GP 20
#define O_FP 16

/* ABA */
#define MCD_A3 12
#define MCD_A2 8
#define MCD_A1 4
#define MCD_A0 0

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

    // callee always saves a0 
    // to a3 in the caller's ABA
    sw a0, O_A0(sp)
    sw a1, O_A1(sp)
    sw a2, O_A2(sp)
    sw a3, O_A3(sp)

    mul s0, a0, a1

    la t0, mcd
    jalr t0

    divu s0, v0

    mflo s0

    move v0, s0

    lw fp, O_FP(sp)
    lw gp, O_GP(sp)
    lw ra, O_RA(sp)

    addiu sp, sp, SS
    jr ra

.end mcm
