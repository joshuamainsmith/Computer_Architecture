.data
.align 2
regs: .space 68 
.align 2
reg_v0_a2: .asciiz "v0,a0,a1,a2 = "
reg_t0_t7: .asciiz "t0 ~ t7     = "
reg_ss_sp: .asciiz "s0,s1,ra,sp = "


.text
main:
# testing reg_dump
addi $a0, $0, 0
addi $a1, $0, 1
addi $a2, $0, 2
addi $t0, $0, 10
addi $t1, $0, 11
addi $t2, $0, 12
addi $t3, $0, 13
addi $t4, $0, 14
addi $t5, $0, 15
addi $t6, $0, 16
addi $t7, $0, 17
jal reg_dump

addi $v0, $0, 10
syscall

print2:
lw $t0, 0($sp)
lw $t1, 4($sp)
 addi $sp, $sp, -4
 sw $ra, 0($sp)
 addi $sp, $sp, -4
 sw $t0, 0($sp)
 jal integer_print
# sw $t1, 0($sp)
# jal integer_print
 addi $sp, $sp, 4
 lw $ra, 0($sp)
 addi $sp, $sp, 4
jr $ra
 

#############################
# prints integer            #
# integer must be placed    #
# on the top of thestack    #
#############################

integer_print:
 addi $sp, $sp, -4
 sw $a0, 0($sp)
 lw $a0, 4($sp)
 addi $v0, $0, 1
 syscall
 lw $a0, 0($sp)
 addi $sp, $sp, 4
 jr $ra


######################
# dumps registers    #
# v0, a0, a1, a2     #
# t0, ......, t7     #
# s0, s1, ra, sp     #
######################

reg_dump:
 addi $sp, $sp, -4
 sw $a2, 0($sp)
 la $a2, regs

 sw $v0, 0($a2)
 sw $a0, 4($a2)
 sw $a1, 8($a2)
# sw $a2, 12($regs)
 sw $t0, 16($a2)
 sw $t1, 20($a2)
 sw $t2, 24($a2)
 sw $t3, 28($a2)
 sw $t4, 32($a2)
 sw $t5, 36($a2)
 sw $t6, 40($a2)
 sw $t7, 44($a2)
 sw $s0, 48($a2)
 sw $s1, 52($a2)
 sw $ra, 56($a2)
 add $t7, $0, $sp
 addi $t7, $t7, 4 

 sw $t7, 60($a2)
 lw $t0, 0($sp)
 sw $t0, 12($a2)
 addi $sp,$sp,4

 addi $t0, $0, 0
 la $a2, regs
dumpagain:
 bne $t0, 0, next1 
 jal cr
 la $a0, reg_v0_a2
 addi $v0, $0, 4
 syscall
 j cont
next1:
 bne $t0, 4, next2 
 jal cr
 la $a0, reg_t0_t7
 addi $v0, $0, 4
 syscall
 j cont
next2:
 bne $t0, 12, next3
 jal cr
 la $a0, reg_ss_sp
 addi $v0, $0, 4
 syscall
next3:
cont:
 lw $a0, 0($a2)
 addi $v0, $0, 1
 syscall
 lw $a0, 0($a2)
 addi $t0, $t0, 1
 beq $t0, 16, done
 jal space
 addi $a2, $a2, 4
 j dumpagain
done:
 jal cr

 la $a2, regs

 lw $v0, 0($a2)
 lw $a0, 4($a2)
 lw $a1, 8($a2)
# sw $a2, 12($regs)
 lw $t0, 16($a2)
 lw $t1, 20($a2)
 lw $t2, 24($a2)
 lw $t3, 28($a2)
 lw $t4, 32($a2)
 lw $t5, 36($a2)
 lw $t6, 40($a2)
 lw $t7, 44($a2)
 lw $s0, 48($a2)
 lw $s1, 52($a2)
 lw $ra, 56($a2)
 lw $sp, 60($a2)
 lw $a2, 12($a2)
 jr $ra

###############
# print space #
###############

space:
addi $sp, $sp, -8
sw $a0, 4($sp)
sw $v0, 0($sp)
addi $a0, $0, 0x20
addi $v0, $0, 11
syscall
lw $a0, 4($sp)
lw $v0, 0($sp)
addi $sp, $sp, 8
jr $ra

###############
# print CR    #
###############
cr:
addi $sp, $sp, -8
sw $a0, 4($sp)
sw $v0, 0($sp)
addi $a0, $0, 0xD
addi $v0, $0, 11
syscall
lw $a0, 4($sp)
lw $v0, 0($sp)
addi $sp, $sp, 8
jr $ra

