module right_shift(result, regi, regii, aritmetic_logic);
	input					aritmetic_logic;
	input		[31:0] 	regi, regii		;
	output	[31:0] 	result			;
	wire					clear				;
	wire		[31:0] 	l_o				,
							l_i				,
							l_ii				,
							l_iii				,
							out				,
							error				;
	right_one_shift 		ros		(l_o		, regi	, regii[0], aritmetic_logic);
	right_two_shift 		rts		(l_i		, l_o		, regii[1], aritmetic_logic);
	right_four_shift 		rfs		(l_ii		, l_i		, regii[2], aritmetic_logic);
	right_eight_shift 	res		(l_iii	, l_ii	, regii[3], aritmetic_logic);
	right_sixteen_shift	rss		(result	, l_iii	, regii[4], aritmetic_logic);
endmodule
