# Project 6
# Recursive Add

.data
	prompt: .asciiz "Enter an integer: "
	result: .asciiz "\nResult: "
	quit: .asciiz "\nPress 0 to quit, anything else to continue: "

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
	
	# Add to stack
	addi $sp, $sp, -8
	
	# Store input onto the stack
	sw $v0, 4($sp)
	
	jal store
	
	# Restore stack
	addi $sp, $sp, 8
	
	# Move result from v0 to t0
	move $t0, $v0
	
	#Display result message
	li $v0, 4 
	la $a0, result
	syscall
	
	#Print int
	li $v0, 1
	move $a0, $t0
	syscall
	
	#Display result message
	li $v0, 4 
	la $a0, quit
	syscall
	
	# Take user input
	li $v0, 5
	syscall
	
	# Decision to end program
	beq $v0, $zero, end
	j main	
	
store:
	# Clear v0
	addi $v0, $zero, 0
	
	# Store return address onto the stack
	sw $ra, 0($sp)
	
	j rec
	
# Rec2
	# addi -4 to sp
	# store ra to the stack
	# addi -4 to sp
	# v0 -1
	# store v0 to stack
	# bne v0 == 0, rec2
	# Add v0, v0, sp(0)
	# 
	 
rec:		
	# Call from the stack
	lw $t0, 4($sp)
	
	# Recursive add into v0
	add $v0, $v0, $t0
	
	# (rec(n - 1))
	addi $t0, $t0, -1
	
	# Store back onto the stack
	sw $t0, 4($sp)
	
	# Return to subroutine if s0 != 0
	bne $t0, $zero, rec
	lw $ra, 0($sp)
	jr $ra
	
end:
	# Quit program
	li $v0,10
	syscall
