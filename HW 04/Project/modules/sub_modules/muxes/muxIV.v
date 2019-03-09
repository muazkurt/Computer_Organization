module muxIV(	result	,
					iii		,
					ii			,
					i			,
					o			,
					select);
	input	iii, ii, i, o	;
	input	[1:0]	select	;
	output		result	;
	wire	[1:0]	mii_res	;
	muxII	_io		(mii_res[0], i, o, select[0]);
	muxII _iii	(mii_res[1], iii, ii, select[0]);
	muxII finish(result, mii_res[1], mii_res[0], select[1]);	
endmodule
