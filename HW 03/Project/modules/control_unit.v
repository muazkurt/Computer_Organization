module control_unit(select_bits_ALU, shift_select, slt_select, write_enable, function_code);

input 	[5:0] function_code;
output 	[2:0] select_bits_ALU;
output	shift_select,
			slt_select,
			write_enable;
			
wire		nfI, nfII, 
			VaI, VoIIoO, IIaO,
			VaIa_OoIIn, OoIIn, rightii,
			lefti, notmidi, midi, righti,
			lefto, notrighto, rightO,
			nfIII, nfIV,
			InoO, IIIn_a_InoO, IInaI, write_ll_result,
			write_l_result,
			write_rnot_result, write_r_result,
			write_result;

/**
	10 0100 	and		24		0	0	0
	10 0101 	or			25 	0	0	1
	10 000X 	add 		20		0	1	0
	10 001X	sub		22		1	0	0
	10 101X	slt		22		1	0	0
	00 0010 	srl		02		1	0	1
	00 0000 	sll		00		1	1	0
	10 0111 	nor		27		1	1	1
*/
			
			
/**
	nfI  		= (!F1)
	nfII 		= (nfII)
	VaI		= F5F1
	VoIIoO	= F5 + F2 + F0
	IIaO		= F2F0
*/
not Inot		(nfI, function_code[1]);
not IInot	(nfII, function_code[2]);
and V_I		(VaI, function_code[5], function_code[1]);
or	 V_II_O	(VoIIoO, function_code[5], function_code[2], function_code[0]);
and II_O		(IIaO, function_code[2], function_code[0]);



/**
	ALU[2] = (VaI)(F0 + (nfII)) + (!((VoIIoO)))
*/
or  nII_O	(OoIIn, function_code[0], nfII);
and ii_left (VaIa_OoIIn, VaI, OoIIn);
not ii_right(rightii, VoIIoO);
or  ii_res	(select_bits_ALU[2], VaIa_OoIIn, rightii);

/**
	ALU[1] = F5(nfII)(nfI) + (!(F2 + F1 + F0)) + (VaI)(IIaO)
*/
and i_left	(lefti, function_code[5], nfII, nfI);
or	 i_midn	(notmidi, function_code[2], function_code[1], function_code[0]);
not i_mid	(midi, notmidi);
and i_right (righti, VaI, IIaO);
or	 i_res	(select_bits_ALU[1], lefti, midi, righti);


/**
	ALU[0] = F5(IIaO) + (!((VoIIoO) + (nfI)))
*/
and o_left	(lefto, function_code[5], IIaO);
or	 o_rightn(notrighto, VoIIoO, nfI);
not o_rigth	(rightO, notrighto);
or	 o_res	(select_bits_ALU[0], lefto, rightO);


buf	slt	(slt_select, function_code[3]);
not	shift (shift_select, function_code[5]);


/**
write enable
10 0X0X 	known
10 X01X		known
10 0111 	knwon
00 00X0 	known
write_enable = (!F4) (F5 ((!F3)((!F1) + F0) + (!F2)F1) + (!(VoIIoO + F3)))
*/

not IIInot			(nfIII, function_code[3]);
not IVnot			(nfIV, function_code[4]);
or	 write_lll_first(InoO, nfI, function_code[0]);
and write_lll_sec	(IIIn_a_InoO, nfIII, InoO);
and write_llr		(IInaI, nfII, function_code[1]);
or  write_llresult(write_ll_result, IIIn_a_InoO, IInaI);
and write_lresult	(write_l_result, function_code[5], write_ll_result);
or	 write_rnot		(write_rnot_result, VoIIoO, function_code[3]);
not write_rresult	(write_r_result, write_rnot_result);
or  write_res		(write_result, write_l_result, write_r_result);
and writeEnable	(write_enable, write_result, nfIV);


endmodule
