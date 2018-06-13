.data
	array: .space 80
	prompt: .asciiz "Enter an integer: "
	option: .asciiz "\nInteger Conversion\nSelect an option\n\n1. Hexadecimal\n2. Binary\n"
	conversion: .asciiz "\nConversion: "
	continue: .asciiz "\nWould you like to continue (1 for yes, 0 for no): "
	save: .asciiz "\nWould you like to save this integer (1 for yes, 0 for no)? "
	arrDisp: .asciiz "\nWould you like to display the contents of the array (1 for yes, 0 for no)? "	
.text
.globl main

main:
	# Display prompt
	li $v0, 4 
	la $a0, prompt 
	syscall
	
	# Scan input
	li $v0, 5
	syscall
	
	# Set s0 to t0
	add $s0, $0, $v0
	
	# Display option
	li $v0, 4 
	la $a0, option 
	syscall
	
	# Scan input
	li $v0, 5
	syscall
	
	beq $v0, 1, hex
	beq $v0, 2, bin
	
cont:
	# Display continue
	li $v0, 4 
	la $a0, continue
	syscall
	
	# Scan input
	li $v0, 5
	syscall
	
	beq $v0, 1, main
	
	li $v0, 10
	syscall
	
hex:
	# Display conversion
	li $v0, 4 
	la $a0, conversion
	syscall
	
	# Display hex
	li $v0, 34
	move $a0, $s0
	syscall
	
	# Display save
	li $v0, 4 
	la $a0, save
	syscall
	
	# Scan input
	li $v0, 5
	syscall
	
	beq $v0, 1, store
	
	j cont

bin:
	# Display conversion
	li $v0, 4 
	la $a0, conversion
	syscall
	
	# Display binary
	li $v0, 35
	move $a0, $s0
	syscall
	
	# Display save
	li $v0, 4 
	la $a0, save
	syscall
	
	# Scan input
	li $v0, 5
	syscall
	
	beq $v0, 1, store
	
	j cont
	
store:
	# Store Value into array
	sw $s0, array($s1)
	
	# Increment iterater
	addi $s1, $s1, 4
	
	# Display save
	li $v0, 4 
	la $a0, arrDisp
	syscall
	
	# Scan input
	li $v0, 5
	syscall
	
	# If no, then go to cont
	beq $v0, 0, cont
	
	# Store into s2 for base value
	add $s2, $0, $s1
	
	# Clear s1
	xor $s1, $s1, $s1
	
	j Display
	
Display:
	
	jal NL
	
	# Display Decimal
	lw $a0, array($s1)
	li $v0, 1
	syscall
	
	jal NL
	
	# Display Hex
	lw $a0, array($s1)
	li $v0, 34
	syscall
	
	jal NL
	
	# Display Binary
	lw $a0, array($s1)
	li $v0, 35
	syscall
	
	jal NL
	
	# Increment
	addi $s1, $s1, 4
	
	# When end of array is reached, leave
	beq $s2, $s1, cont
	
	j Display

	# Print new line while saving a0	
NL:
	addi $sp, $sp, -4
	
	sw $a0, 0($sp)
	
	li $v0, 11
	li $a0, 0x0a
	syscall
	
	lw $a0, 0($sp)
	
	addi $sp, $sp, 4
	
	jr $ra
	
	
	