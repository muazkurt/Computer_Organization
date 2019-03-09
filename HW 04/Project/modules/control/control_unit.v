module control_unit(select_bits_ALU, shift_select, slt_select, write_enable, function_code);

input 	[5:0] function_code;
output 	[2:0] select_bits_ALU;
output	shift_select,
			slt_select,
			write_enable;
			
wire		Not_1, Not_2, Not_3, Not_4,
			And_5_1, Or_5_2_0, And_2_0,
			And_5_1__Or_0__not_2, Or_0__not_2, 
			Right2,
			Left1, Not_mid1, Mid1, Right1,
			Left0, Not_right0, Right0,
			Or__not_1_0, And__not_3__Or__not_1_0, 
			And_1__not_2, 


			write_Left_Left,
			write_Left,
			write__not_right, write_right,
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
	Not_1  		= (!F1)
	Not_2 		= (Not_2)
	And_5_1		= F5F1
	Or_5_2_0	= F5 + F2 + F0
	And_2_0		= F2F0
*/
not Inot		(Not_1, function_code[1]);
not IInot	(Not_2, function_code[2]);
and V_I		(And_5_1, function_code[5], function_code[1]);
or	 V_II_O	(Or_5_2_0, function_code[5], function_code[2], function_code[0]);
and II_O		(And_2_0, function_code[2], function_code[0]);



/**
	ALU[2] = (And_5_1)(F0 + (Not_2)) + (!((Or_5_2_0)))
*/
or  nII_O	(Or_0__not_2, function_code[0], Not_2);
and ii_left (And_5_1__Or_0__not_2, And_5_1, Or_0__not_2);
not ii_right(Right2, Or_5_2_0);
or  ii_res	(select_bits_ALU[2], And_5_1__Or_0__not_2, Right2);

/**
	ALU[1] = F5(Not_2)(Not_1) + (!(F2 + F1 + F0)) + (And_5_1)(And_2_0)
*/
and i_left	(Left1, function_code[5], Not_2, Not_1);
or	 i_midn	(Not_mid1, function_code[2], function_code[1], function_code[0]);
not i_mid	(Mid1, Not_mid1);
and i_right (Right1, And_5_1, And_2_0);
or	 i_res	(select_bits_ALU[1], Left1, Mid1, Right1);


/**
	ALU[0] = F5(And_2_0) + (!((Or_5_2_0) + (Not_1)))
*/
and o_left	(Left0, function_code[5], And_2_0);
or	 o_rightn(Not_right0, Or_5_2_0, Not_1);
not o_rigth	(Right0, Not_right0);
or	 o_res	(select_bits_ALU[0], Left0, Right0);


buf	slt	(slt_select, function_code[3]);
not	shift (shift_select, function_code[5]);


/**
write enable
10 0X0X 	known
10 X01X		known
10 0111 	knwon
00 00X0 	known
write_enable = (!F4) (F5 ((!F3)((!F1) + F0) + (!F2)F1) + (!(Or_5_2_0 + F3)))
*/

not IIInot			(Not_3, function_code[3]);
not IVnot			(Not_4, function_code[4]);
or	 write_lll_first(Or__not_1_0, Not_1, function_code[0]);
and write_lll_sec	(And__not_3__not_1_0, Not_3, Or__not_1_0);
and write_llr		(And_1__not_2, Not_2, function_code[1]);
or  write_llresult(write_Left_Left, And__not_3__Or__not_1_0, And_1__not_2);
and write_lresult	(write_Left, function_code[5], write_Left_Left);
or	 write_rnot		(write__not_right, Or_5_2_0, function_code[3]);
not write_rresult	(write_right, write__not_right);
or  write_res		(write_result, write_Left, write_right);
and writeEnable	(write_enable, write_result, Not_4);


endmodule
