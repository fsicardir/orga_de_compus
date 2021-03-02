.text
    li $t1, 16 #0
    jr $t1 #4
    add $0, $0, $0 #8
    add $0, $0, $0 #12
    li $t2, 32 #16
    jalr $t2 #20
    add $0, $0, $0 #24
    j end #28
    jr $ra #32
    end:
    nop
