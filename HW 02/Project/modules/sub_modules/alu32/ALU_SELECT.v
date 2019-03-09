module ALU_SELECT(result, 	_nor	,
									_lsh	,
									_rsh	,
									_sub	,
									_xor	,
									_sum	,
									_or	,
									_and	,
									alu_in);
		input		[31:0]	_nor	,
								_lsh	,
								_rsh	,
								_sub	,
								_xor	,
								_sum	,
								_or	,
								_and	;
		input		[2:0]		alu_in;
		output	[31:0]	result;
		
		muxVIII			o		(result[0]		,	_nor[0]	,	_lsh[0]	,	_rsh[0]	,	_sub[0]	,	_xor[0]	,	_sum[0]	,	_or[0]	,	_and[0]	, alu_in);
		muxVIII			i		(result[1]		,	_nor[1]	,	_lsh[1]	,	_rsh[1]	,	_sub[1]	,	_xor[1]	,	_sum[1]	,	_or[1]	,	_and[1]	, alu_in);
		muxVIII			ii		(result[2]		,	_nor[2]	,	_lsh[2]	,	_rsh[2]	,	_sub[2]	,	_xor[2]	,	_sum[2]	,	_or[2]	,	_and[2]	, alu_in);
		muxVIII			iii	(result[3]		,	_nor[3]	,	_lsh[3]	,	_rsh[3]	,	_sub[3]	,	_xor[3]	,	_sum[3]	,	_or[3]	,	_and[3]	, alu_in);
		muxVIII			iv		(result[4]		,	_nor[4]	,	_lsh[4]	,	_rsh[4]	,	_sub[4]	,	_xor[4]	,	_sum[4]	,	_or[4]	,	_and[4]	, alu_in);
		muxVIII			v		(result[5]		,	_nor[5]	,	_lsh[5]	,	_rsh[5]	,	_sub[5]	,	_xor[5]	,	_sum[5]	,	_or[5]	,	_and[5]	, alu_in);
		muxVIII			vi		(result[6]		,	_nor[6]	,	_lsh[6]	,	_rsh[6]	,	_sub[6]	,	_xor[6]	,	_sum[6]	,	_or[6]	,	_and[6]	, alu_in);
		muxVIII			vii	(result[7]		,	_nor[7]	,	_lsh[7]	,	_rsh[7]	,	_sub[7]	,	_xor[7]	,	_sum[7]	,	_or[7]	,	_and[7]	, alu_in);
		muxVIII			viii	(result[8]		,	_nor[8]	,	_lsh[8]	,	_rsh[8]	,	_sub[8]	,	_xor[8]	,	_sum[8]	,	_or[8]	,	_and[8]	, alu_in);
		muxVIII			ix		(result[9]		,	_nor[9]	,	_lsh[9]	,	_rsh[9]	,	_sub[9]	,	_xor[9]	,	_sum[9]	,	_or[9]	,	_and[9]	, alu_in);
		muxVIII			x		(result[10]		,	_nor[10]	,	_lsh[10]	,	_rsh[10]	,	_sub[10]	,	_xor[10]	,	_sum[10]	,	_or[10]	,	_and[10]	, alu_in);
		muxVIII			xi		(result[11]		,	_nor[11]	,	_lsh[11]	,	_rsh[11]	,	_sub[11]	,	_xor[11]	,	_sum[11]	,	_or[11]	,	_and[11]	, alu_in);
		muxVIII			xii	(result[12]		,	_nor[12]	,	_lsh[12]	,	_rsh[12]	,	_sub[12]	,	_xor[12]	,	_sum[12]	,	_or[12]	,	_and[12]	, alu_in);
		muxVIII			xiii	(result[13]		,	_nor[13]	,	_lsh[13]	,	_rsh[13]	,	_sub[13]	,	_xor[13]	,	_sum[13]	,	_or[13]	,	_and[13]	, alu_in);
		muxVIII			xiv	(result[14]		,	_nor[14]	,	_lsh[14]	,	_rsh[14]	,	_sub[14]	,	_xor[14]	,	_sum[14]	,	_or[14]	,	_and[14]	, alu_in);
		muxVIII			xv		(result[15]		,	_nor[15]	,	_lsh[15]	,	_rsh[15]	,	_sub[15]	,	_xor[15]	,	_sum[15]	,	_or[15]	,	_and[15]	, alu_in);
		muxVIII			xvi	(result[16]		,	_nor[16]	,	_lsh[16]	,	_rsh[16]	,	_sub[16]	,	_xor[16]	,	_sum[16]	,	_or[16]	,	_and[16]	, alu_in);
		muxVIII			xvii	(result[17]		,	_nor[17]	,	_lsh[17]	,	_rsh[17]	,	_sub[17]	,	_xor[17]	,	_sum[17]	,	_or[17]	,	_and[17]	, alu_in);
		muxVIII			xviii	(result[18]		,	_nor[18]	,	_lsh[18]	,	_rsh[18]	,	_sub[18]	,	_xor[18]	,	_sum[18]	,	_or[18]	,	_and[18]	, alu_in);
		muxVIII			xix	(result[19]		,	_nor[19]	,	_lsh[19]	,	_rsh[19]	,	_sub[19]	,	_xor[19]	,	_sum[19]	,	_or[19]	,	_and[19]	, alu_in);
		muxVIII			xx		(result[20]		,	_nor[20]	,	_lsh[20]	,	_rsh[20]	,	_sub[20]	,	_xor[20]	,	_sum[20]	,	_or[20]	,	_and[20]	, alu_in);
		muxVIII			xxi	(result[21]		,	_nor[21]	,	_lsh[21]	,	_rsh[21]	,	_sub[21]	,	_xor[21]	,	_sum[21]	,	_or[21]	,	_and[21]	, alu_in);
		muxVIII			xxii	(result[22]		,	_nor[22]	,	_lsh[22]	,	_rsh[22]	,	_sub[22]	,	_xor[22]	,	_sum[22]	,	_or[22]	,	_and[22]	, alu_in);
		muxVIII			xxiii	(result[23]		,	_nor[23]	,	_lsh[23]	,	_rsh[23]	,	_sub[23]	,	_xor[23]	,	_sum[23]	,	_or[23]	,	_and[23]	, alu_in);
		muxVIII			xxiv	(result[24]		,	_nor[24]	,	_lsh[24]	,	_rsh[24]	,	_sub[24]	,	_xor[24]	,	_sum[24]	,	_or[24]	,	_and[24]	, alu_in);
		muxVIII			xxv	(result[25]		,	_nor[25]	,	_lsh[25]	,	_rsh[25]	,	_sub[25]	,	_xor[25]	,	_sum[25]	,	_or[25]	,	_and[25]	, alu_in);
		muxVIII			xxvi	(result[26]		,	_nor[26]	,	_lsh[26]	,	_rsh[26]	,	_sub[26]	,	_xor[26]	,	_sum[26]	,	_or[26]	,	_and[26]	, alu_in);
		muxVIII			xxvii	(result[27]		,	_nor[27]	,	_lsh[27]	,	_rsh[27]	,	_sub[27]	,	_xor[27]	,	_sum[27]	,	_or[27]	,	_and[27]	, alu_in);
		muxVIII			xxviii(result[28]		,	_nor[28]	,	_lsh[28]	,	_rsh[28]	,	_sub[28]	,	_xor[28]	,	_sum[28]	,	_or[28]	,	_and[28]	, alu_in);
		muxVIII			xxix	(result[29]		,	_nor[29]	,	_lsh[29]	,	_rsh[29]	,	_sub[29]	,	_xor[29]	,	_sum[29]	,	_or[29]	,	_and[29]	, alu_in);
		muxVIII			xxx	(result[30]		,	_nor[30]	,	_lsh[30]	,	_rsh[30]	,	_sub[30]	,	_xor[30]	,	_sum[30]	,	_or[30]	,	_and[30]	, alu_in);
		muxVIII			xxxi	(result[31]		,	_nor[31]	,	_lsh[31]	,	_rsh[31]	,	_sub[31]	,	_xor[31]	,	_sum[31]	,	_or[31]	,	_and[31]	, alu_in);
		
endmodule
		