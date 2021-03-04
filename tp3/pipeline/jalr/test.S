       addi $a0, $0, jump
       jalr $a0
       addi $a1, $0, 100
       addi $a2, $0, 100
       addi $a3, $0, 100
jump:  addi $a0, $0, 200
       jr   $ra
