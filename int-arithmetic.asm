.data
prompts:
    .asciiz "Enter an integer: "
    .asciiz "Enter another integer: "

	smaller: .word 0
	larger: .word 0

.text
.globl main
swap:
	add $t2, $t0, $zero
	add $t3, $t1, $zero

	add $t0, $t3, $zero
	add $t1, $t2, $zero

main:
    # prompt the user
    lui $a0, 0x1001
    ori $a0, $a0, 0x0000
    la $a0, prompts
    li $v0, 4
    syscall

	# take input
	li $v0, 5
	syscall
	
	# store input
	add $t0, $v0, $zero
	
	# prompt the user
    lui $a0, 0x1001
    ori $a0, $a0, 0x0013
    li $v0, 4
    syscall
	
	# take input
	li $v0, 5
	syscall
	
	# store input
	add $t1, $v0, $zero
	
	# check for larger number
	bgt $t0, $t1, swap
	
	
	
