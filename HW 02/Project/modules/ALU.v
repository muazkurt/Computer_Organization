module ALU (out, regi, regii, select);
	input		[2:0]		select;
	input		[31:0]	regi	,
							regii	;
	output	[31:0]	out	;
	wire		cout				,
				subselect		;
	wire		[1:0]		temp	;
	wire		[31:0]	_and	,
							_or	,
							_sum	,
							_xor	,
							_rsh	,
							_lsh	,
							_nor	,
							bufi	,
							bufo	;
	
	not			ti			(temp[0], select[0]);
	not			tii		(temp[1], select[1]);
	and			find		(subselect, select[2], temp[1], temp[0]);
	adder			add_res	(_sum, _and, _or, _xor, cout, regi, regii, subselect);
	right_shift	rsr		(_rsh, regi, regii, 1'b1);
	reverse		rvsf		(bufi, regi);
	right_shift	lsr		(bufo, bufi, regii, 1'b1);
	reverse		rvss		(_lsh, bufo);
	notxxxii		noter		(_nor, _or);
	ALU_SELECT	result	(out, _nor, _lsh, _rsh, _sum, _xor, _sum, _or, _and, select);
endmodule
