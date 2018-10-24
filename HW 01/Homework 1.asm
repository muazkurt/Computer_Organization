		.data 
welcome:	.asciiz "Welcome\nPlease give filename: "

zero:	.asciiz "zero"

one:	.asciiz "one"

two:	.asciiz "two"

three:	.asciiz "three"

four:	.asciiz "four"

five:	.asciiz "five"

six:	.asciiz "six"

seven:	.asciiz "seven"

eight:	.asciiz "eight"

nine:	.asciiz "nine"

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
	add	$a1 $a1 $v0
	sb	$zero 0($a1)
	#close file
	add	$a0, $zero, $s0
	addi	$v0, $zero, 16
	syscall
	
	#parameters
	add	$a0 $zero $s1
	jal	check
	
	addi	$v0, $zero, 10
	syscall
#end of main




	#a0 -> address of the input array. 
check:
	
	


	addi	$sp $sp -4
	sw	$s0 0($sp)
	add	$s0 $zero $a0
	add	$t0 $zero $s0
	addi	$t1 $zero 47		# prewious of '0' 
	addi	$t2 $zero 58		# next item of '9'
sub_routine:	
	lb	$t3 0($t0)
	beq	$t3, $zero, loopexit

	#if (*a <= '9' && *a >= '0')
		slt	$t4 $t1 $t3
		slt	$t5 $t3 $t2
		beq	$t4 $t5 true
		#false
			addi	$v0 $zero 11
			add	$a0 $zero $t3
			syscall
			j both
		
		#end false

		true:	
			addi	$t6 $t1 1
			la	$a0 zero
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 one
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 two
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 three
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 four
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 five
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 six
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 seven
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 eight
			beq	$t3 $t6 after
			addi	$t6 $t6 1
			la	$a0 nine
			beq	$t6 $t6 after
			j both
			after:
			addi	$v0 $zero 4
			syscall
		#end else
both:
	addi	$t0 $t0 1
	j	sub_routine
	
	
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





