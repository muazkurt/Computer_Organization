		.data 
welcome:	.asciiz "Welcome\nPlease give filename: "


		.text
main:
	jal	Open_file
	add	$s0, $zero, $v0
	
	addi	$sp $sp -256
	add	$s1 $sp $zero
	#read file
	addi	$v0, $zero, 14
	add	$a0, $zero, $s0
	add	$a1, $zero, $s1
	addi	$a2, $zero, 256
	syscall
	#close file
	add	$a0, $zero, $s0
	addi	$v0, $zero, 16
	syscall
	
	#parameters
	jal check
	
	addi	$v0, $zero, 10
	syscall
#end of main



check:
	beq	$v0, $zero, loopexit
	
	addi	$v0 $zero 11
	lb	$a0 0($a1)
	syscall
	addi	$v0 $zero 14
	j	check
loopexit:

	addi	$sp $sp 256

	jr	$ra
#end of check	


Open_file:
	#Write welcome
	addi	$v0 $zero 4
	la	$a0 welcome
	syscall
	#Read filename
	addi	$sp $sp -256
	add	$s0 $sp $zero
	add	$t0 $s0 $zero
	addi	$t1 $zero 10

	read_filename:
		addi	$v0 $zero 12
		syscall
		beq	$t1 $v0 end_read_filename
		sb	$v0 0($t0)
		addi	$t0 $t0 1
		j	read_filename
	end_read_filename:
	sb	$zero 0($t0)
	#Open file
	addi	$v0, $zero, 13
	add	$a0 $s0 $zero
	addi	$a1, $zero, 0
	addi	$a2, $zero, 0
	syscall
	addi	$sp $sp 256
	jr	$ra
#end of Open_file