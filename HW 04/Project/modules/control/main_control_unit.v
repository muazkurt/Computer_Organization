module main_control_unit(select, 
								Its_a_branch, 
								alu_mem, 
								Memmory_Read_Enable, 
								Memmory_Write_En, 
								Immediate_Register, 
								Shift_Resources_Select, 
								Rd_Rt, 
								Register_Write_Enable, 
								Zero_Extend, 
								Its_a_jump, 
								Set_Less_Than_Select, 
								Op_code, 
								Func_code);
	wire				And_3__not_1, 
						And_3__not_2__not_0, 
						And__And_3__not_1_And_3__not_2__not_0,
						RD_RT_Right_Right, RD_RT_Left_Left, RD_RT_Left_Right, 
						Rtype, Not_rtype, 
						RD_RT_Left, RD_RT_Right, 
						Reg_Write_Right_Left, Reg_Write_Right_Right, Reg_Write_Right, renres,
						Imm_Right_Left, Imm_Right_Right, Imm_Right,
						
						ALU_CONTROL_WRITE, ALU_CONTROL_SHIFT, ALU_CONTROL_SLT_SELECT,
						
						Zero_Extend_Left, Zero_Extend_Left_Left, 
						Zero_Extend_Left_Left_Right, Zero_Extend_Left_Right, 
						Zero_Extend_Right, Zero_Extend_Left_result, Zero_Extend_final,

						Select_1_Right_Left, Select_1_Right_Right, Select_1_Right,
						Select_2_Right_Left, Select_2_Right_Right, Select_2_Right;
						
	wire		[2:0]	alucontrolselects,
						controlselects;
	
	wire		[5:0]	Not_5_4_3_2_1_0;
	
	
	input		[5:0]	Op_code, Func_code;
						
	output 				Its_a_branch, 
						alu_mem, 
						Memmory_Read_Enable, 
						Memmory_Write_En,
						Immediate_Register, 
						Shift_Resources_Select,
						Rd_Rt,
						Register_Write_Enable,
						Zero_Extend,
						Its_a_jump, 
						Set_Less_Than_Select;
						
	output	[2:0] select;
	
	or					rtyper(Rtype, Op_code[5], Op_code[4], Op_code[3], Op_code[2], Op_code[1], Op_code[0]);
	not				noter(Not_rtype, Rtype);
	
	control_unit	alucont(alucontrolselects, 
								ALU_CONTROL_SHIFT, 
								ALU_CONTROL_SLT_SELECT, 
								ALU_CONTROL_WRITE, 
								Func_code);
		
	not	nv(Not_5_4_3_2_1_0[5], Op_code[5]);
	not	niv(Not_5_4_3_2_1_0[4], Op_code[4]);
	not	niii(Not_5_4_3_2_1_0[3], Op_code[3]);
	not	nii(Not_5_4_3_2_1_0[2], Op_code[2]);
	not	ni(Not_5_4_3_2_1_0[1], Op_code[1]);
	not	n0(Not_5_4_3_2_1_0[0], Op_code[0]);
	
	and	stepi(And_3__not_1, Op_code[3], Not_5_4_3_2_1_0[1]);
	and	stepii(And_3__not_2__not_0, Op_code[3],Not_5_4_3_2_1_0[2], Not_5_4_3_2_1_0[0]);
	and	stepiii(And__And_3__not_1_And_3__not_2__not_0, And_3__not_1, And_3__not_2__not_0);

	
////////
	and	branchfind(Its_a_branch, Not_5_4_3_2_1_0[5], Not_5_4_3_2_1_0[4], Not_5_4_3_2_1_0[3], Op_code[2], Not_5_4_3_2_1_0[1], Not_5_4_3_2_1_0[0]);
////////	
	and	alumemfind(alu_mem, Op_code[5], Not_5_4_3_2_1_0[4], Not_5_4_3_2_1_0[3], Not_5_4_3_2_1_0[2], Op_code[1], Op_code[0]);
////////	
	buf	mreadfind(Memmory_Read_Enable, alu_mem);
////////	
	and	mwritefind(Memmory_Write_En, Op_code[5], Not_5_4_3_2_1_0[4], Op_code[3], Not_5_4_3_2_1_0[2], Op_code[1], Op_code[0]);
////////
	and	immrl(Imm_Right_Left, Not_5_4_3_2_1_0[5], And__And_3__not_1_And_3__not_2__not_0);

	and	immrr(Imm_Right_Right, Op_code[5], Not_5_4_3_2_1_0[2], Op_code[1], Op_code[0]);
	or		immr(Imm_Right, Imm_Right_Right, Imm_Right_Left);
	and	immediate(Immediate_Register, Imm_Right, Not_5_4_3_2_1_0[4]);
////////
	and	shiftr(Shift_Resources_Select, ALU_CONTROL_SHIFT, Not_rtype);
////////
	and	rdrtrigh(RD_RT_Right_Right, Op_code[5], Not_5_4_3_2_1_0[2], Op_code[1], Op_code[0]);
	and	rdrtll(RD_RT_Left_Left, Op_code[2], Not_5_4_3_2_1_0[1], Not_5_4_3_2_1_0[0]);
	or		rdrtlr(RD_RT_Left_Right, RD_RT_Left_Left, And__And_3__not_1_And_3__not_2__not_0);

	and	rdrtl(RD_RT_Left, Not_5_4_3_2_1_0[5], RD_RT_Left_Right);
	or		rdrtrres(RD_RT_Right, RD_RT_Right_Right, RD_RT_Left);
	and	rdrtres(Rd_Rt, Not_5_4_3_2_1_0[4], RD_RT_Right);
////////
	and	rwrleft(Reg_Write_Right_Left, Not_5_4_3_2_1_0[5], And__And_3__not_1_And_3__not_2__not_0);

	and	rwrright(Reg_Write_Right_Right, Op_code[5], Not_5_4_3_2_1_0[3], Not_5_4_3_2_1_0[2], Op_code[1], Op_code[0]);
	or		rwright(Reg_Write_Right, Reg_Write_Right_Left, Reg_Write_Right_Right);
	and	rwrite(renres, Not_5_4_3_2_1_0[4], Reg_Write_Right);
	muxII	resultrwen(Register_Write_Enable, renres, ALU_CONTROL_WRITE, Rtype);
////////
	or		zexllr(Zero_Extend_Left_Left_Right, Not_5_4_3_2_1_0[1], Not_5_4_3_2_1_0[0]);
	and	zexlleft(Zero_Extend_Left_Left, Zero_Extend_Left_Left_Right, Op_code[3], Not_5_4_3_2_1_0[2]);
	and	zexlr(Zero_Extend_Left_Right, Not_5_4_3_2_1_0[3], Op_code[2], Not_5_4_3_2_1_0[1], Not_5_4_3_2_1_0[0]);
	or		zexl(Zero_Extend_Left, Zero_Extend_Left_Left, Zero_Extend_Left_Right);
	and	zexlres(Zero_Extend_Left_result, Zero_Extend_Left);
	and	zexr(Zero_Extend_Right, Op_code[5], Not_5_4_3_2_1_0[3], Not_5_4_3_2_1_0[2], Op_code[1], Op_code[0]);
	or		zex(Zero_Extend_final, Zero_Extend_Right, Zero_Extend_Left_result);
	and	zextender(Zero_Extend, Not_5_4_3_2_1_0[4], Zero_Extend_final);
////////
	and	jumper(Its_a_jump, Not_5_4_3_2_1_0[5], Not_5_4_3_2_1_0[4], Not_5_4_3_2_1_0[3], Not_5_4_3_2_1_0[2], Op_code[1], Not_5_4_3_2_1_0[0]);
////////
	or		slfind(Set_Less_Than_Select, ALU_CONTROL_SLT_SELECT, Not_5_4_3_2_1_0[5], Not_5_4_3_2_1_0[4], Op_code[3], Not_5_4_3_2_1_0[2], Op_code[1], Not_5_4_3_2_1_0[0]);
////////
	and	select2rl(Select_2_Right_Left, Not_5_4_3_2_1_0[3], Op_code[2], Not_5_4_3_2_1_0[1]);
	and	select2rr(Select_2_Right_Right, Op_code[3], Not_5_4_3_2_1_0[2], Op_code[1]);
	or		select2r(Select_2_Right, Select_2_Right_Left, Select_2_Right_Right);
	and	select2(controlselects[2], Select_2_Right, Not_5_4_3_2_1_0[5], Not_5_4_3_2_1_0[4], Not_5_4_3_2_1_0[0]);
	muxII	result2(select[2], controlselects[2], alucontrolselects[2], Rtype);
////////
	and	select1rl(Select_1_Right_Left, Not_5_4_3_2_1_0[5], Op_code[3], Not_5_4_3_2_1_0[2], Op_code[1]);
	and	select1rr(Select_1_Right_Right, Op_code[5], Not_5_4_3_2_1_0[2], Op_code[1], Op_code[0]);
	or		select1r(Select_1_Right, Select_1_Right_Left, Select_1_Right_Right);
	and	selecti(controlselects[1], Select_1_Right, Not_5_4_3_2_1_0[4]);
	muxII	result1(select[1], alucontrolselects[1], controlselects[1], Rtype);
////////
	and	select0(controlselects[0], Not_5_4_3_2_1_0[5], Not_5_4_3_2_1_0[4], Op_code[3], Not_5_4_3_2_1_0[2], Op_code[1], Not_5_4_3_2_1_0[0]);
	muxII	result0(select[0], controlselects[0], alucontrolselects[0], Rtype);
endmodule
