	.data
a:	
	.align	2
	.space 32
l:  .word 8
promptInput:	.asciiz "Enter an integer : "
promptOutput:	.asciiz "Value is : "
newline:	.asciiz "\n"
	.text
main:
	#initialize
	lw $s0,l
	li $t0,0
	li $t1,0
loop:
	#Print prompt
	beq $t0,$s0,terminate
	
	li $v0,4
	la $a0,promptInput
	syscall

	li $v0,5
	syscall
	sw $v0,a($t1)

	addi $t0,$t0,1
	addi $t1,$t1,4

	b loop

terminate:
	li $v0 10
	syscall


