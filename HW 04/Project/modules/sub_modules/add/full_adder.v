module full_adder(sum, L_a_R, L_o_R, L_XOR_R, cout, left, right, cin);
	input left, right, cin;
	output 	sum, cout,
				L_a_R		, 	// called X in other wires
				L_o_R		,	// called Y in other wires
				L_XOR_R	;
	wire		X_n	, 	// called Xn in other wires
				LXR_a_C,	// called LTC in other wires
				LXR_o_C,	
				LTC_n	;
			
	and	left_and_right	(L_a_R, left, right);
	or		left_or_right	(L_o_R, left, right);
	not	landr				(X_n, L_a_R);
	and	xnay				(L_XOR_R, X_n, L_o_R);
	and	l_a_cin			(LXR_a_C, L_XOR_R, cin);
	not	noting			(LTC_n, LXR_a_C);
	or		l_o_cin			(LXR_o_C, L_XOR_R, cin);
	or		couter			(cout, L_a_R, LXR_a_C);
	and	summer			(sum, LTC_n, LXR_o_C);
	
endmodule
