#include <sys/regdef.h>


#define SRA_S 8
#define LTA_S 8
#define ABA_S 0
#define SS (SRA_S + LTA_S + ABA_S)

#define O_A3 (SS + 12) //
#define O_A2 (SS + 8)  // in caller's ABA
#define O_A1 (SS + 4)  //
#define O_A0 SS        //

#define O_GP (ABA_S + LTA_S + 4) // in it's own SRA
#define O_FP (ABA_S + LTA_S + 0) //

#define O_N (ABA_S + 4) // in it's own LTA
#define O_M (ABA_S + 0) //

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
