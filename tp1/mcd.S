#include <sys/regdef.h>

#define SS 16
#define O_GP 12
#define O_FP 8
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

    /* LTA */
    sw a0, O_M(sp)
    sw a1, O_N(sp)

    lw t1, O_N(sp)
    beqz t1, end

repeat:
    lw t0, O_M(sp)
    lw t1, O_N(sp)
    divu t0, t1
    mfhi t0
    sw t0, O_N(sp)
    sw t1, O_M(sp)
    bnez t0, repeat

end:
    lw v0, O_M(sp)
    lw fp, O_FP(sp)
    lw gp, O_GP(sp)

    addiu sp, sp, SS
    jr ra
.end mcd
