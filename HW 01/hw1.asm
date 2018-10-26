		.data 
welcome:	.asciiz "Welcome\nPlease give filename: "
nsfod:		.asciiz "No such file or directory."


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
####################################
#####	Main Procedure		####
main:
	jal	Open_file
	add	$s0 $zero $v0
	slt	$t0 $s0 $zero
	beq	$t0 $zero file_opened
	la	$a0 nsfod
	addi	$v0 $zero 4
	syscall
	j	exit
file_opened:
	addi	$sp $sp -256
	add	$s1 $sp $zero
	#read file
	addi	$v0 $zero 14
	add	$a0 $zero $s0
	add	$a1 $zero $s1
	addi	$a2 $zero 256
	syscall
	add	$a1 $a1 $v0
	sb	$zero 0($a1)
	#close file
	add	$a0 $zero $s0
	addi	$v0 $zero 16
	syscall

	#	give parameters
	add	$a0 $zero $s1
	#	call check method
	jal	check
	
	addi	$sp $sp 256
exit:
	addi	$v0 $zero 10
	syscall
#end of main




	#a0 -> address of the input array. 
check:
	addi	$sp $sp -8
	sw	$s0 0($sp)
	sw	$s1 4($sp)
	
	#	Capital start flag
	add	$s1 $zero $zero
	#	$s0 = array start
	add	$s0 $zero $a0
	#	$t0 = array start (temp)
	add	$t0 $zero $s0
	addi	$t1 $zero '0'		# prewious of '0' 
	addi	$t1 $t1 -1
	addi	$t2 $zero '9'		# next item of '9'
	addi	$t2 $t2 1
	
	########################################
	######		While loop	    ####
	######		while( *a != null   #### 
	whileLoop:
		lb	$t3 0($t0)
		beq	$t3 $zero loopexit

		#########################################
		#	*a >= 0	 -->	$t4 = 1		#
			slt	$t4 $t1 $t3		#
		#	*a <= 9	 --> 	$t5 = 1		#
			slt	$t5 $t3 $t2		#
			and	$t4 $t4 $t5		#
			beq	$t4 $zero dontOwerride	#
		#########################################
		#		a = s0			#
			beq	$t0 $s0 capital		#
		#########################################
		
		#########################################
		#	FOR LOOP			#
		#########################################
		#	  HEAD				#
		#		temp = currentP		#
			addi	$t4 $t0 0
		#	Loop Start			#
		check_prewious:
		#		temp > startOf arr	#
			slt	$t5 $s0 $t4
			beq	$t5 $zero prewious_OK
		#	HEAD END			#
		#########################################
		#	temp2	= *(temp - 1)		#
			lb	$t5 -1($t4)
		#	if				#
		#		Math Operations		#
			addi	$t6 $zero '-'
			beq	$t6 $t5 prewious_OK
			addi	$t6 $zero '/'
			beq	$t6 $t5 prewious_OK
			addi	$t6 $zero '*'
			beq	$t6 $t5 prewious_OK
			addi	$t6 $zero '+'
			beq	$t6 $t5 prewious_OK
			addi	$t6 $zero '%'
			beq	$t6 $t5 prewious_OK
			addi	$t6 $zero '_'
			beq	$t6 $t5 prewious_OK
			addi	$t6 $zero '='
			beq	$t6 $t5 prewious_OK
		#	    temp2 == ' ' | '\n' | '\t'	#
			addi	$t6 $zero ' '
			beq	$t6 $t5 check1_true
			addi	$t6 $zero '\t'
			beq	$t6 $t5 check1_true
			addi	$t6 $zero '\n'
			beq	$t6 $t5 check1_true
			addi	$t6 $zero '\r'
			beq	$t6 $t5 check1_true
		#			False		#
			j	check1_dontOwerride
		#		True			#
		check1_true:
		#	temp2 = *(temp - 2)		#
			lb	$t5 -2($t4)
		#	if 				#
		#	 temp2 == '.' | '!' | '?' | ':' #
			addi	$t6 $zero '.'
			beq	$t6 $t5 capital
			addi	$t6 $zero '!'
			beq	$t6 $t5 capital
			addi	$t6 $zero '?'
			beq	$t6 $t5 capital
			addi	$t6 $zero ':'
			beq	$t6 $t5 capital
		#			False		#
			j	prewious_OK
		#	first if's false statement	#
		check1_dontOwerride:
			lb	$t5 0($t4)
		#	*t >= 0	 -->	$t4 = 1		#
			slt	$t6 $t1 $t5		#
		#	*a <= 9	 --> 	$t5 = 1		#
			slt	$t7 $t5 $t2		#
			and	$t6 $t6 $t7		#
			beq	$t6 $zero dontOwerride	#
			addi	$t4 $t4 -1
			j	check_prewious
		#########################################
		#		END OF FOR LOOP		#
		#########################################
		
		capital:
			addi	$s1 $zero -32
		prewious_OK:
		#########################################
		#	FOR LOOP			#
		#########################################
		#	  HEAD				#
		#		temp = currentP		#
			addi	$t4 $t0 0
		#	Loop Start			#
		check_next:
		#		temp > startOf arr	#
			lb	$t5 0($t4)
			beq	$t5 $zero detectNumber
		#	HEAD END			#
		#	if				#
		#		*(t + 1) = '.'
			lb	$t5 1($t4)
			addi	$t6 $zero '.'
			beq	$t5 $t6	Nokta
		#			False		#
			slt	$t6 $t1 $t5		#
			slt	$t7 $t5 $t2		#
			and	$t6 $t6 $t7		#
			beq	$t6 $zero detectNumber	#
		#			False		#
			addi	$t4 $t4 1
			j	check_next		#	
		Nokta:
			lb	$t5 2($t4)
			slt	$t6 $t1 $t5		#
			slt	$t7 $t5 $t2		#
			beq	$t6 $t7 dontOwerride	#
		#########################################
		####		END OF FOR LOOP		#
		#########################################
		
		#########################################
		###		Switch-Case	      ###
		detectNumber:	
			# case: 0
			addi	$t6 $t1 1
			la	$a0 zero
			beq	$t3 $t6 foundNumber
			# case: 1
			addi	$t6 $t6 1
			la	$a0 one
			beq	$t3 $t6 foundNumber
			# case: 2
			addi	$t6 $t6 1
			la	$a0 two
			beq	$t3 $t6 foundNumber
			# case: 3
			addi	$t6 $t6 1
			la	$a0 three
			beq	$t3 $t6 foundNumber
			# case: 4
			addi	$t6 $t6 1
			la	$a0 four
			beq	$t3 $t6 foundNumber
			# case: 5
			addi	$t6 $t6 1
			la	$a0 five
			beq	$t3 $t6 foundNumber
			# case: 6
			addi	$t6 $t6 1
			la	$a0 six
			beq	$t3 $t6 foundNumber
			# case: 7
			addi	$t6 $t6 1
			la	$a0 seven
			beq	$t3 $t6 foundNumber
			# case: 8
			addi	$t6 $t6 1
			la	$a0 eight
			beq	$t3 $t6 foundNumber
			# case: 9
			addi	$t6 $t6 1
			la	$a0 nine
			beq	$t6 $t6 foundNumber
			# default:
			j both
		###	END of Switch-Case	      ###
		#########################################
		
		#########################################
		#####		Print as String	    #####
		foundNumber:
			lb	$t6 0($a0)
			add	$t6 $t6	$s1
			sb	$t6 0($a0)
			addi	$v0 $zero 4
			syscall
			sub	$t6 $t6 $s1
			sb	$t6 0($a0)
			j both
		#########################################
		#####	 End Of Print as String	    #####
		#########################################
		
		
		#########################################
		####	Print as a Char		     ####
		dontOwerride:
			addi	$v0 $zero 11
			add	$a0 $zero $t3
			syscall
		#########################################
		####	End of Print as a Char	     ####
		
		both:
			add	$s1 $zero $zero
			addi	$t0 $t0 1
			j	whileLoop
	########################################
	######		End Of While loop   ####
	########################################
loopexit:
	lw	$s1 4($sp) 
	lw	$s0 0($sp)
	addi	$sp $sp 8
	jr	$ra
###		End Of Procedure	###
###########################################





###########################################
###		Procedure		###
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
	addi	$v0 $zero 13
	add	$a0 $s0 $zero
	addi	$a1 $zero 0
	addi	$a2 $zero 0
	syscall
	addi	$sp $sp 256
	jr	$ra
###		End Of Procedure	###
###########################################
