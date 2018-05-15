# Project 6
# Recursive Add

.data
	prompt: .asciiz "Enter an integer: "
	result: .asciiz "\nResult: "

.text

.globl main

main:
	#Display prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Take user input
	li $v0, 5
	syscall
	
	# Move result to s0
	move $s0, $v0
	
	# Add to stack
	addi $sp, $sp, -4
	
	jal rec
	
	#Display result message
	li $v0, 4 
	la $a0, result
	syscall
	
	#Print int
	li $v0, 1
	lw $a0, 0($sp)
	syscall
	
	# Restore stack
	addi $sp, $sp, 4
	
	# Quit program
	li $v0,10
	syscall
	 
rec:	
	# Recursive add
	add $s1, $s1, $s0
	
	# Store result on stack
	sw $s1, 0($sp)
	
	# Decrement
	addi $s0, $s0, -1
	
	# Return to subroutine if s0 != 0
	bne $s0, $zero, rec
	jr $ra