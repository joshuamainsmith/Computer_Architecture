# Project 5:
# Implement 2 subroutines


.data
	before: .asciiz "\nBefore: "
	after: .asciiz "\nAfter: " 
	string1: .asciiz "string1"
	string2: .asciiz "hello"
	NL: .asciiz "\n"
	x: .word 5
	y: .word 6
.text
.globl main

main:
#####################################
	# 1. swap()
#####################################
	
	# initialize two variables
	# int a = 5, b = 6
	la $s0, x
	la $s1, y
	
	# Jump to Before subroutine
	jal Before
	
	# Allocate space to the stack
	addi $sp, $sp, -8
	
	# Store data onto the stack
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	
	# Jump to Swap subroutine
	jal Swap
	
	# Free space from the stack
	addi $sp, $sp, 8
	
	# Jump to After subroutine
	jal After
	
#####################################
	# 2. strcpy()
##################################### 

	# Clearing s0 and s1
	xor $s0, $s0, $s0
	xor $s1, $s1, $s1
	
	jal NewLine
	
	#Display "before" message
	li $v0, 4
	la $a0, before
	syscall
	
	jal NewLine
	
	# Printing String 1
	li $v0, 4
	la $a0, string1
	syscall
	
	jal NewLine
	
	# Printing String 2
	li $v0, 4
	la $a0, string2
	syscall
	
	jal NewLine
	
	# Storing strings in argument registers
	la $a0, string1
	la $a1, string2
	
	# Jump to strcpy
	jal strcpy
	
	# Jump to first loop
	jal strcpyLoop
	
	#Display "after" message
	li $v0, 4
	la $a0, after
	syscall
	
	jal NewLine
	
	# Display string1
	li $v0, 4
	la $a0, string1
	syscall
	
	jal NewLine
	
	# Display string2
	li $v0, 4
	la $a0, string2
	syscall
	
	jal NewLine
	
	# Jump to end of program
	j end

	
#####################################
	# 1. swap() Subroutines
#####################################
	
	# Displaying before message for swap()
Before:
	#Display "before" message
	li $v0, 4
	la $a0, before
	syscall
	
	# Print integer "a" (s0)
	li $v0, 1
	lw $a0, ($s0)
	syscall
	
	#Display "before" message
	li $v0, 4
	la $a0, before
	syscall
	
	# Print integer "b" (s1)
	li $v0, 1
	lw $a0, ($s1)
	syscall
	
	# Return to main function
	jr $ra
	
Swap:
	# Swapping integers
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	
	lw $t0, 0($s0)
	lw $t1, 0($s1)
	
	sw $t0, 0($s0)
	sw $t1, 0($s1)
	jr $ra
	
	#Displaying after message for swap()
After:
	#Display "after" message
	li $v0, 4
	la $a0, after
	syscall
	
	# Print integer "a" (s0)
	li $v0, 1
	#addi $a0, $s0, 0
	lw $a0, ($s0)
	syscall
	
	#Display "after" message
	li $v0, 4
	la $a0, after
	syscall
	
	# Print integer "b" (s1)
	li $v0, 1
	lw $a0, ($s1)
	syscall
	
	# Return to main function (line 49)
	jr $ra
	

	
#####################################
	# 2. strcpy() Subroutines
##################################### 	

strcpy:
	# Allocate space to the stack
	addi $sp, $sp, -4
	
	# Store register s0 to the stack
	sw $s0, 0($sp)

	# Initialize s0 (counter) to zero
	add $s0, $zero, $zero
	
	jr $ra

strcpyLoop:
	# Set a1 at s0 into t1
	add $t1, $s0, $a1
	
	# Contents from t1 at index s0 to t2
	lbu $t2, 0($t1)
	
	# Set a0 at index s0 into t3
	add $t3, $s0, $a0
	
	# Store t3 into t2 (the string copy process)
	sb $t2, 0($t3)
	
	# If finished, go to strcpyRestore
	beq $t2, $zero, strcpyRestore
	
	# Else, increment s0
	addi $s0, $s0, 1
	
	j strcpyLoop
	
strcpyRestore:
	# Restore s0
	lw $s0, 0($sp)
	
	# Deallocate the stack
	addi $sp, $sp, 4
	
	jr $ra
	
NewLine:
	# Make a new line
	li $v0, 4
	la $a0, NL
	syscall
	
	jr $ra
	
end:
	# Quitting program
	li $v0,10
	syscall
	
	
# 1. swap()
# Example C code:
#
# main ()
# {
#	int a = 5, b = 6;
#	swap(a,b);
#	// or
#	swap (&a, &b);
# }
#
# swap (a, b)
# {
#	// this0
#	t = a;
#	a = b;
#	b = t;
# }
# // or
# swap (*a, *b)
# {
#	// this1
#	t = *a;
#	*a = *b;
#	*b = t;
# }
#
# 2. strcpy()
# Example C code:
# while (*t++ = *s++);