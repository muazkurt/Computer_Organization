module right_eight_shift(result, regi, regii, aritmetic_logic);
	input				regii				,
						aritmetic_logic;
	input 	[31:0] regi				;
	output	[31:0] result			;
	wire				msb			;
	
	/*
		If aritmetic_logic = 0, then it's an aritmetic right shift.
		Otherwise, logic right shift.
	*/
	muxII mostsb(msb, 1'b0, regi[31], aritmetic_logic);
	
	muxII	o		(result[0], regi[8]	, regi[0] , regii);
	muxII	i		(result[1], regi[9]	, regi[1] , regii);
	muxII	ii		(result[2], regi[10]	, regi[2] , regii);
	muxII	iii	(result[3], regi[11]	, regi[3] , regii);
	muxII	iv		(result[4], regi[12]	, regi[4] , regii);
	muxII	v		(result[5], regi[13]	, regi[5] , regii);
	muxII	vi		(result[6], regi[14]	, regi[6] , regii);
	muxII	vii	(result[7], regi[15]	, regi[7] , regii);
	muxII	viii	(result[8], regi[16]	, regi[8] , regii);
	muxII	ix		(result[9], regi[17]	, regi[9] , regii);
	muxII	x		(result[10], regi[18], regi[10], regii);
	muxII	xi		(result[11], regi[19], regi[11], regii);
	muxII	xii	(result[12], regi[20], regi[12], regii);
	muxII	xiii	(result[13], regi[21], regi[13], regii);
	muxII	xiv	(result[14], regi[22], regi[14], regii);
	muxII	xv		(result[15], regi[23], regi[15], regii);
	muxII	xvi	(result[16], regi[24], regi[16], regii);
	muxII	xvii	(result[17], regi[25], regi[17], regii);
	muxII	xviii	(result[18], regi[26], regi[18], regii);
	muxII	xix	(result[19], regi[27], regi[19], regii);
	muxII	xx		(result[20], regi[28], regi[20], regii);
	muxII	xxi	(result[21], regi[29], regi[21], regii);
	muxII	xxii	(result[22], regi[30], regi[22], regii);
	muxII	xxiii	(result[23], regi[31], regi[23], regii);
	muxII	xxiv	(result[24], msb, regi[24], regii);
	muxII	xxv	(result[25], msb, regi[25], regii);
	muxII	xxvi	(result[26], msb, regi[26], regii);
	muxII	xxvii	(result[27], msb, regi[27], regii);
	muxII	xxviii(result[28], msb, regi[28], regii);
	muxII	xxix	(result[29], msb, regi[29], regii);
	muxII	xxx	(result[30], msb, regi[30], regii);
	muxII	xxxi	(result[31], msb, regi[31], regii);
endmodule
