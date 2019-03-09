module adder(out, and_r, or_r, xor_r, overflow, left, right, sum_ornot);
	input		[31:0]	left,right	;
	input		sum_ornot				;
	output	[31:0] 	out			, 
							and_r			, 
							or_r			,
							xor_r			;
	output	overflow					;
	wire		[30:0]	carriage		;
	wire		[31:0]	rlast			;
	
	xorxxxii		rcng	(rlast, sum_ornot, right);
	
	full_adder	o		(out[0], and_r[0], or_r[0], xor_r[0], carriage[0], left[0],rlast[0], sum_ornot);
	full_adder	i		(out[1], and_r[1], or_r[1], xor_r[1], carriage[1], left[1],rlast[1], carriage[0]);
	full_adder	ii		(out[2], and_r[2], or_r[2], xor_r[2], carriage[2], left[2],rlast[2], carriage[1]);
	full_adder	iii	(out[3], and_r[3], or_r[3], xor_r[3], carriage[3], left[3],rlast[3], carriage[2]);
	full_adder	iv		(out[4], and_r[4], or_r[4], xor_r[4], carriage[4], left[4],rlast[4], carriage[3]);
	full_adder	v		(out[5], and_r[5], or_r[5], xor_r[5], carriage[5], left[5],rlast[5], carriage[4]);
	full_adder	vi		(out[6], and_r[6], or_r[6], xor_r[6], carriage[6], left[6],rlast[6], carriage[5]);
	full_adder	vii	(out[7], and_r[7], or_r[7], xor_r[7], carriage[7], left[7], rlast[7], carriage[6]);
	full_adder	viii	(out[8], and_r[8], or_r[8], xor_r[8], carriage[8], left[8], rlast[8], carriage[7]);
	full_adder	ix		(out[9], and_r[9], or_r[9], xor_r[9], carriage[9], left[9], rlast[9], carriage[8]);
	full_adder	x		(out[10], and_r[10], or_r[10], xor_r[10], carriage[10], left[10], rlast[10], carriage[9]);
	full_adder	xi		(out[11], and_r[11], or_r[11], xor_r[11], carriage[11], left[11], rlast[11], carriage[10]); 
	full_adder	xii	(out[12], and_r[12], or_r[12], xor_r[12], carriage[12], left[12], rlast[12], carriage[11]);
	full_adder	xiii	(out[13], and_r[13], or_r[13], xor_r[13], carriage[13], left[13], rlast[13], carriage[12]);
	full_adder	xiv	(out[14], and_r[14], or_r[14], xor_r[14], carriage[14], left[14], rlast[14], carriage[13]);
	full_adder	xv		(out[15], and_r[15], or_r[15], xor_r[15], carriage[15], left[15], rlast[15], carriage[14]);
	full_adder	xvi	(out[16], and_r[16], or_r[16], xor_r[16], carriage[16], left[16], rlast[16], carriage[15]);
	full_adder	xvii	(out[17], and_r[17], or_r[17], xor_r[17], carriage[17], left[17], rlast[17], carriage[16]);
	full_adder	xviii	(out[18], and_r[18], or_r[18], xor_r[18], carriage[18], left[18], rlast[18], carriage[17]);
	full_adder	xix	(out[19], and_r[19], or_r[19], xor_r[19], carriage[19], left[19], rlast[19], carriage[18]);
	full_adder	xx		(out[20], and_r[20], or_r[20], xor_r[20], carriage[20], left[20], rlast[20], carriage[19]);
	full_adder	xxi	(out[21], and_r[21], or_r[21], xor_r[21], carriage[21], left[21], rlast[21], carriage[20]);
	full_adder	xxii	(out[22], and_r[22], or_r[22], xor_r[22], carriage[22], left[22], rlast[22], carriage[21]);
	full_adder	xxiii	(out[23], and_r[23], or_r[23], xor_r[23], carriage[23], left[23], rlast[23], carriage[22]);
	full_adder	xxiv	(out[24], and_r[24], or_r[24], xor_r[24], carriage[24], left[24], rlast[24], carriage[23]);
	full_adder	xxv	(out[25], and_r[25], or_r[25], xor_r[25], carriage[25], left[25], rlast[25], carriage[24]);
	full_adder	xxvi	(out[26], and_r[26], or_r[26], xor_r[26], carriage[26], left[26], rlast[26], carriage[25]);
	full_adder	xxvii	(out[27], and_r[27], or_r[27], xor_r[27], carriage[27], left[27], rlast[27], carriage[26]);
	full_adder	xxviii(out[28], and_r[28], or_r[28], xor_r[28], carriage[28], left[28], rlast[28], carriage[27]);
	full_adder	xxix	(out[29], and_r[29], or_r[29], xor_r[29], carriage[29], left[29], rlast[29], carriage[28]);
	full_adder	xxx	(out[30], and_r[30], or_r[30], xor_r[30], carriage[30], left[30], rlast[30], carriage[29]);
	full_adder	xxxi	(out[31], and_r[31], or_r[31], xor_r[31], overflow, left[31], rlast[31], carriage[30]);
endmodule
	