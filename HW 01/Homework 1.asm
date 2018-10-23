		.data 
welcome:	.asciiz "Welcome\nPlease give filename: "
input:		.asciiz "testout.txt"
buffer:		.word '\0'


		.text
main:
	jal	Open_file
	add	$s1, $zero, $v0
#Read file
	la	$s2, buffer
	
	
	
read:	addi	$v0, $zero, 14
	add	$a0, $zero, $s1
	add	$a1, $zero, $s2
	addi	$a2, $zero, 1
	syscall
	beq	$v0, $zero, loopexit
	sb	$zero 1($s2)
	addi	$v0 $zero 4
	add	$a0 $zero $s2
	syscall
	addi	$s2, $s2, 1
	j	read
loopexit:
	add	$a0, $zero, $s1
	addi	$v0, $zero, 16
	syscall
	
	addi	$sp, $sp, +100
	addi	$v0, $zero, 10
	syscall


Open_file:
#Write welcome
	addi	$v0 $zero 4
	la	$a0 welcome
	syscall
#Read filename
	addi	$sp $sp -256
	add	$s0 $sp $zero
	add	$a0 $s0 $zero
	addi	$t1 $zero 10
	addi	$a1 $zero 2

	read_filename:
		addi	$v0 $zero 8
		syscall
		lb	$t2 0($a0)
		beq	$t1 $t2 end_read_filename
		addi	$a0 $a0 1
		j	read_filename
	end_read_filename:
	sb	$zero 0($a0)
#Open file
	addi	$v0, $zero, 13
	add	$a0 $s0 $zero
	addi	$a1, $zero, 0
	addi	$a2, $zero, 0
	syscall
	addi	$sp $sp 256
	jr	$ra