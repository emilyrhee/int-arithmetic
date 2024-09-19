.data
prompts:
    .asciiz "Enter an integer: "
    .asciiz "Enter another integer: "

	smaller: .word 0
	larger: .word 0

.text
.globl main
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
	sw $v0, smaller
	
	# prompt the user
    lui $a0, 0x1001
    ori $a0, $a0, 0x0013
    li $v0, 4
    syscall
	
	# take input
	li $v0, 5
	syscall
	
	# store input
	sw $v0, larger
	
	