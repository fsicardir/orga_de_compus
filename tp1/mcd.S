#include <sys/regdef.h>

#define SS 16

/* ABA Caller */
#define O_A3 28
#define O_A2 24
#define O_A1 20
#define O_A0 16

/* SRA */
#define O_GP 12
#define O_FP 8

/* LTA */
#define O_N 4
#define O_M 0

.text
.align 2

/* 
unsigned int mcd(unsigned int m, unsigned int n) 
*/

.globl mcd
.ent mcd

mcd:
    subu sp, sp, SS
    /* SRA */
    sw gp, O_GP(sp)
    sw fp, O_FP(sp)

    move fp, sp

    // callee always saves a0 
    // to a3 in the caller's ABA
    sw a0, O_A0(sp)
    sw a1, O_A1(sp)
    sw a2, O_A2(sp)
    sw a3, O_A3(sp)

    /* LTA */
    sw a0, O_M(sp)
    sw a1, O_N(sp)

repeat:
    lw t1, O_N(sp)
    beqz t1, end
    lw t0, O_M(sp)
    divu t0, t1
    mfhi t0
    sw t0, O_N(sp)
    sw t1, O_M(sp)
    j repeat

end:
    lw v0, O_M(sp)
    lw fp, O_FP(sp)
    lw gp, O_GP(sp)

    addiu sp, sp, SS
    jr ra
.end mcd
