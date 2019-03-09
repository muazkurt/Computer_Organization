module alu32(in, clock);
	input				clock;
	input [31:0]	in;
	wire 	[31:0]	rs,
						rt,
						shiftImm,
						left, right,
						alu_out, less,
						result;
	wire	[2:0]		alubits;
	wire				slt, shift, write_en;
	
	control_unit	cont_bits	(alubits, shift, slt, write_en, in[5:0]);
	register			parse			(rs, rt, in[25:21], in[20:16], in[15:11], result, write_en, clock);
	extend_XXVII	shifter		(shiftImm, in[10:6]);
	muxLXIV_XXXII	rs_rt			(left, rt, rs, shift);
	muxLXIV_XXXII	rt_sh			(right, shiftImm, rt, shift);
	
	ALU 				operation	(alu_out, left, right, alubits);
	
	extend_XXXII	isless		(less, alu_out[31]);
	muxLXIV_XXXII	out_select	(result, less, alu_out, slt);
	
	
endmodule
	