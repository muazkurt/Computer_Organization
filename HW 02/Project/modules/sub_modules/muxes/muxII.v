module muxII(result, i, o, select);
	input		i, o, select;
	output	result		;
	wire		n_select		;
	wire		[1:0]	and_r	;
	not	snt			(n_select, select);
	and	_o				(and_r[0], n_select, o);
	and	_i				(and_r[1], select, i);
	or		_ii			(result, and_r[0], and_r[1]);
endmodule
