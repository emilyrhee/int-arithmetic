# Emily Rhee

.data
prompts:
    .asciiz "Enter an integer: " # 19 chars
    .asciiz "Enter another integer: " # 24 chars, sum 0x2B (43)
	.asciiz "Larger integer: " 
	.asciiz "Smaller integer: "
	.asciiz "Quotient: "
	.asciiz "Remainder: "

.text
.globl main
main:
    # print user prompt
    lui $a0, 0x1001
    addi $v0, $zero, 4
    syscall

	# take input
	addi $v0, $zero, 5
	syscall
	
	# store input
	add $t0, $v0, $zero
	
	# print user prompt
    lui $a0, 0x1001
    ori $a0, $a0, 0x0013
    addi $v0, $zero, 4
    syscall
	
	# take input
	addi $v0, $zero, 5
	syscall

	# store input
	add $t1, $v0, $zero
	
	# check for larger number
	bgt $t0, $t1, swap
	
results:
	# print larger int
    lui $a0, 0x1001
    ori $a0, $a0, 0x002B
	addi $v0, $zero, 4
	syscall
	
	add $a0, $t1, $zero
	addi $v0, $zero, 1
	syscall
	
	# terminate program
	addi $v0, $zero, 17
	syscall
	
swap:
	add $t2, $t0, $zero
	add $t3, $t1, $zero

	add $t0, $t3, $zero
	add $t1, $t2, $zero
	
	j results
