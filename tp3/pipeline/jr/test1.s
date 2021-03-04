li $t1, 10
li $t2, then
jr $t2
li $t2, 50
add:
add $t3, $t1, $t2
li $t5, end
jr $t5
nop
then:
li $s1, add
jr $s1
end:
nop
