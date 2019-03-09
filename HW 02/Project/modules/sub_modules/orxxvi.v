module orxxvi(out, in);
	input [31:0] in;
	output		out;
	wire[27:0] temp;
	or	o		(temp[0], in[31], in[5]);
	or	i		(temp[1], in[30], in[6]);
	or	ii		(temp[2], in[29], in[7]);
	or	iii	(temp[3], in[28], in[8]);
	or	iv		(temp[4], in[27], in[9]);
	or	v		(temp[5], in[26], in[10]);
	or	vi		(temp[6], in[25], in[11]);
	or	vii	(temp[7], in[24], in[12]);
	or	viii	(temp[8], in[23], in[13]);
	or	ix		(temp[9], in[22], in[14]);
	or	x		(temp[10], in[21], in[15]);
	or	xi		(temp[11], in[20], in[16]);
	or	xii	(temp[12], in[19], in[17]);
	or	xiii	(temp[13], in[18], temp[12]);
	
	
	
	or	xiv	(temp[14], temp[13], temp[0]);
	or	xv		(temp[15], temp[12], temp[1]);
	or	xvi	(temp[16], temp[11], temp[2]);
	or	xvii	(temp[17], temp[10], temp[3]);
	or	xviii	(temp[18], temp[9], temp[4]);
	or	xix	(temp[19], temp[8], temp[5]);
	or	xx		(temp[20], temp[7], temp[6]);
	
	
	
	or	xxi	(temp[21], temp[20], temp[14]);
	or	xxii	(temp[22], temp[19], temp[15]);
	or	xxiii	(temp[23], temp[18], temp[16]);
	or	xxiv	(temp[24], temp[21], temp[17]);
	
	
	or	xxv	(temp[25], temp[24], temp[21]);
	or	xxvi	(temp[26], temp[23], temp[22]);
	
	or	xxvii	(temp[27], temp[25], temp[26]);
	
	not xxviii (out, temp[27]);
	
endmodule