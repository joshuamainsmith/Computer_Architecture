.data
	prompt: .asciiz "\nEnter an integer: "
	select: .asciiz "\nEnter 0 for add, 1 for subtract: "
	result: .asciiz "\nThe result is: "
	
.text
.globl main
main:
	#Display
	li $v0, 4 #4 tells computer that string will be called
	la $a0, prompt #displaying "prompt"
	syscall
	
	#Getting input
	li $v0, 5 #Telling computer to input an integer
	syscall
	
	#Store result in $t0
	move $t0, $v0 #addi?
	
	#Display
	li $v0, 4 #4 tells computer that string will be called
	la $a0, prompt #displaying "prompt"
	syscall
	
	#Getting input
	li $v0, 5 #Telling computer to input an integer
	syscall
	
	#Store result in $t1
	move $t1, $v0 #addi?
	
	li $v0, 4 #4 tells computer that string will be called
	la $a0, select #displaying "select"
	syscall
	
	#Getting input
	li $v0, 5 #Telling computer to input an integer
	syscall
	
	#Store result in $t2
	move $t2, $v0 #addi?
	
	### do beq for whether $v0 == 0 (adding) or 1 (subtracting)
	beq $t2, $zero, adding
	beq $t2, 1, subtract
	
	
adding:	
	#arithmetic
	add $t0, $t0, $t1
	
	#Display
	li $v0, 4
	la $a0, result
	syscall
	
	#Print int
	li $v0, 1 #printing int is 1
	move $a0, $t0
	syscall
	
	
subtract:	
	#Check if addition was selected
	beq $t2, $zero, end
	
	#arithmetic
	sub $t0, $t0, $t1
	
	#Display
	li $v0, 4
	la $a0, result
	syscall
	
	#Print int
	li $v0, 1 #printing int is 1
	move $a0, $t0
	syscall
	
end:
j main
li $v0,10
syscall