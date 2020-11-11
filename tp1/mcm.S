#include <sys/regdef.h>

#define SRA_S 16
#define LTA_S 0
#define ABA_S 16
#define SS (SRA_S + LTA_S + ABA_S)

#define O_A3 (SS + 12) //
#define O_A2 (SS + 8)  // in caller's ABA
#define O_A1 (SS + 4)  //
#define O_A0 SS        //

#define O_RA (ABA_S + LTA_S + 8) //
#define O_GP (ABA_S + LTA_S + 4) // in it's own SRA
#define O_FP (ABA_S + LTA_S + 0) //

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
