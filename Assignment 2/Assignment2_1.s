	.data
prompt1 : .asciiz "Enter first integer : "
prompt2 : .asciiz "Enter second integer : "
o : .asciiz "GCD of two numbers are : " 
	.text
main:

	# initialize
	li	$s0, 10
		#Read two integers
	# prompt for first input
	li	$v0, 4
	la	$a0, prompt1
	syscall
	# read in the first value
	li	$v0, 5
	syscall
	move	$t1, $v0
	# prompt for second input
	li	$v0, 4
	la	$a0, prompt2
	syscall
	# read in the second value
	li	$v0, 5
	syscall
	move	$t2, $v0

	move $a0,$t1

	move $a1,$t2

	#Adjust sp/ store ra
	addi $sp,$sp,-12
	sw $ra,0($sp)

	#Calling function
	jal gcd

	#Readjusting sp/store ra
	lw $ra,0($sp)
	addi $sp,$sp,12

	#Transferring result
	move $s0,$v0

	#Printing the result

	li $v0,4
	la $a0,o
	syscall

	move $a0,$s0
	li $v0,1
	syscall

	#Exit the program
	li $v0,10
	syscall
gcd:
	bne $a0,$zero,recurse
	move $v0,$a1
	jr $ra
recurse:
	sub $sp,$sp,12
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	div $a1,$a0
	move $a1,$a0
	mfhi $a0
	jal gcd
	lw $ra,0($sp)
	addi $sp,$sp,12
	jr $ra
