# Emily Rhee

.data
prompts:
    .asciiz "Enter an integer: " # 19 chars (including null char), sum 0x13
    .asciiz "Enter another integer: " # 24 chars, sum 0x2B (43)

result_labels:
	.asciiz "Larger integer: " # 17 chars, sum 0x3C (60)
	.asciiz "Smaller integer: " # 18 chars, sum 0x4E (78)
	.asciiz "Quotient: " # 11 chars, sum 0x59 (89)
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
	
divide:
	div $t1, $t0
	mflo $t2
	mfhi $t3
	
results:
	# print larger int
    lui $a0, 0x1001
    ori $a0, $a0, 0x002B
	addi $v0, $zero, 4
	syscall
	
	add $a0, $t1, $zero
	addi $v0, $zero, 1
	syscall
	
	# print new line
	addi $a0, $zero, 10 # ASCII value of '\n' is 10
	addi $v0, $zero, 11
	syscall
	
	# print smaller int
    lui $a0, 0x1001
    ori $a0, $a0, 0x003C
	addi $v0, $zero, 4
	syscall

	add $a0, $t0, $zero
	addi $v0, $zero, 1
	syscall
	
	# print new line
	addi $a0, $zero, 10 # ASCII value of '\n' is 10
	addi $v0, $zero, 11
	syscall
	
	# print quotient
	lui $a0, 0x1001
    ori $a0, $a0, 0x004E
	addi $v0, $zero, 4
	syscall
	
	add $a0, $t2, $zero
	addi $v0, $zero, 1
	syscall
	
	# print new line
	addi $a0, $zero, 10 # ASCII value of '\n' is 10
	addi $v0, $zero, 11
	syscall
	
	# print remainder
	lui $a0, 0x1001
    ori $a0, $a0, 0x0059
	addi $v0, $zero, 4
	syscall
	
	add $a0, $t3, $zero
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
	
	j divide
