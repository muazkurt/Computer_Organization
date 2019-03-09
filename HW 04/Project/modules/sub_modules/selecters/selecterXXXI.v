module selecterXXXI(oput, _i, _o, select);
	input					select;
	input		[31:0]	_i, _o;
	output	[31:0]	oput;
	
	muxII	o			(oput[0], _i[0], _o[0], select);
	muxII	i			(oput[1], _i[1], _o[1], select);
	muxII	ii			(oput[2], _i[2], _o[2], select);
	muxII	iii		(oput[3], _i[3], _o[3], select);
	muxII	iv			(oput[4], _i[4], _o[4], select);
	muxII	v			(oput[5], _i[5], _o[5], select);
	muxII	vi			(oput[6], _i[6], _o[6], select);
	muxII	vii		(oput[7], _i[7], _o[7], select);
	muxII	viii		(oput[8], _i[8], _o[8], select);
	muxII	ix			(oput[9], _i[9], _o[9], select);
	
	muxII	x			(oput[10], _i[10], _o[10], select);
	muxII	xi			(oput[11], _i[11], _o[11], select);
	muxII	xii		(oput[12], _i[12], _o[12], select);
	muxII	xiii		(oput[13], _i[13], _o[13], select);
	muxII	xiv		(oput[14], _i[14], _o[14], select);
	muxII	xv			(oput[15], _i[15], _o[15], select);
	muxII	xvi		(oput[16], _i[16], _o[16], select);
	muxII	xvii		(oput[17], _i[17], _o[17], select);
	muxII	xviii		(oput[18], _i[18], _o[18], select);
	muxII	xix		(oput[19], _i[19], _o[19], select);
	
	muxII	xx			(oput[20], _i[20], _o[20], select);
	muxII	xxi		(oput[21], _i[21], _o[21], select);
	muxII	xxii		(oput[22], _i[22], _o[22], select);
	muxII	xxiii		(oput[23], _i[23], _o[23], select);
	muxII	xxiv		(oput[24], _i[24], _o[24], select);
	muxII	xxv		(oput[25], _i[25], _o[25], select);
	muxII	xxvi		(oput[26], _i[26], _o[26], select);
	muxII	xxvii		(oput[27], _i[27], _o[27], select);
	muxII	xxviii	(oput[28], _i[28], _o[28], select);
	muxII	xxix		(oput[29], _i[29], _o[29], select);

	muxII	xxx		(oput[30], _i[30], _o[30], select);
	muxII	xxxi		(oput[31], _i[31], _o[31], select);	
endmodule
