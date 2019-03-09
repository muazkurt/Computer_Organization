module muxLXIV_XXXII(result, i, o, select);
	input [31:0]	i, o;
	input 			select;
	output [31:0] 	result;
	
	muxII	o_e	(result[0],  i[0], o[0], select);
	muxII	i_e	(result[1],  i[1], o[1], select);
	muxII	ii		(result[2],  i[2], o[2], select);
	muxII	iii	(result[3],  i[3], o[3], select);
	muxII	iv		(result[4],  i[4], o[4], select);
	muxII	v		(result[5],  i[5], o[5], select);
	muxII	vi		(result[6],  i[6], o[6], select);
	muxII	vii	(result[7],  i[7], o[7], select);
	muxII	viii	(result[8],  i[8], o[8], select);
	muxII	ix		(result[9],  i[9], o[9], select);
	muxII	x		(result[10], i[10], o[10], select);
	muxII	xi		(result[11], i[11], o[11], select);
	muxII	xii	(result[12], i[12], o[12], select);
	muxII	xiii	(result[13], i[13], o[13], select);
	muxII	xiv	(result[14], i[14], o[14], select);
	muxII	xv		(result[15], i[15], o[15], select);
	muxII	xvi	(result[16], i[16], o[16], select);
	muxII	xvii	(result[17], i[17], o[17], select);
	muxII	xviii	(result[18], i[18], o[18], select);
	muxII	xix	(result[19], i[19], o[19], select);
	muxII	xx		(result[20], i[20], o[20], select);
	muxII	xxi	(result[21], i[21], o[21], select);
	muxII	xxii	(result[22], i[22], o[22], select);
	muxII	xxiii	(result[23], i[23], o[23], select);
	muxII	xxiv	(result[24], i[24], o[24], select);
	muxII	xxv	(result[25], i[25], o[25], select);
	muxII	xxvi	(result[26], i[26], o[26], select);
	muxII	xxvii	(result[27], i[27], o[27], select);
	muxII	xxviii(result[28], i[28], o[28], select);
	muxII	xxix	(result[29], i[29], o[29], select);
	muxII	xxx	(result[30], i[30], o[30], select);
	muxII	xxxi	(result[31], i[31], o[31], select);
endmodule
