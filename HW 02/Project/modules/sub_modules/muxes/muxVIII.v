module muxVIII(result	,
					vii		,
					vi			,
					v			,
					iv			,
					iii		,
					ii			,
					i			,
					o			,
					select);
	input			vii		,
					vi			,
					v			,
					iv			,
					iii		,
					ii			,
					i			,
					o			;
	input	[2:0]	select	;
	output		result	;
	wire	[1:0]	muxIV_r	;
	
	muxIV	iiiiiio	(muxIV_r[0], iii, ii, i, o, select[1:0]);
	muxIV viiviviv	(muxIV_r[1], vii, vi, v, iv, select[1:0]);
	muxII	allresult(result, muxIV_r[1], muxIV_r[0], select[2]);
endmodule
