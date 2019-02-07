			.data
prompt1: .asciiz "Enter first integer : "
prompt2: .asciiz "Enter second integer : "
str1:   .asciiz "The addition is : "
newline: .asciiz "\n"
.globl main
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
	#Finished Reading of two integers
	#Addition
add $t3,$t2,$t1
	#Prompt for printing the result
li $v0 4
la $a0 str1
syscall
	#Print Result
li $v0,	1
move $a0, $t3
syscall
li $v0 10
syscall
	#End program
