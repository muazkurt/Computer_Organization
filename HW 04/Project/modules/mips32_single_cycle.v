module mips32_single_cycle(clock);
	input clock;
	wire	branch,
			alu_mem, 
			memred_en, 
			memwrite_en, 
			immediate_res, 
			shift_select, 
			rd_rt, 
			reg_write, 
			zeroextend, 
			jump, 
			slt_select,
			equals, branch_select;
	wire	[2:0]			alubits;
	wire	[4:0]			rt_rd_chosen;
	wire	[31:0]		in,
							S_ZextendImm,
							shiftImm,
							jumpaddr,
							PCIplus,
							branchaddress,
							addr,
							PCInet, branch_re, branch_shifted, braddr_pre;
	reg 	[31:0]		PCI;
	
	
	always @(posedge clock)	
	begin
		PCI <= addr;
	end
	instrmemread readinstr(in, PCI, clock);


	main_control_unit	cont_bits	(alubits, 
								branch,
								alu_mem, 
								memred_en, 
								memwrite_en, 
								immediate_res, 
								shift_select, 
								rd_rt, 
								reg_write, 
								zeroextend, 
								jump, 
								slt_select, in[31:26], in[5:0]);
								
	muxII					rtrdo			(rt_rd_chosen[4], in[15], in[20], rd_rt);
	muxII					rtrdi			(rt_rd_chosen[3], in[14], in[19], rd_rt);
	muxII					rtrdii		(rt_rd_chosen[2], in[13], in[18], rd_rt);
	muxII					rtrdiii		(rt_rd_chosen[1], in[12], in[17], rd_rt);
	muxII					rtrdiv		(rt_rd_chosen[0], in[11], in[16], rd_rt);
	
	extend_XVI			immeFind		(S_ZextendImm, in[15:0], zeroextend);
	extend_XXVII		shifter		(shiftImm, in[10:6]);
	
	
	mips32				operation(
										equals,
										in[25:21],
										in[20:16], 
										rt_rd_chosen, 
										shiftImm, 
										S_ZextendImm,
										shift_select, 
										slt_select, 
										alubits, 
										reg_write, 
										memred_en, 
										memwrite_en, 
										alu_mem, 
										immediate_res,
										clock);
										
	adder					findaddr(PCIplus, , , , , PCI, 32'b1, 1'b0);
//	reverse				br(branch_re, S_ZextendImm);
//	right_two_shift	bradd(branch_shifted, branch_re, 1'b1, 1'b1);
//	reverse				brfin(braddr_pre, branch_shifted);
	adder					findbaddr(branchaddress, , , , , PCIplus, S_ZextendImm, 1'b0);
	and					branchselect(branch_select, equals, branch);
	selecterXXXI		finddaddr(PCInet, branchaddress, PCIplus, branch_select);
	selecterXXXI		findrealaddr(addr, jumpaddr, PCInet, jump);
	
	
	
	buf					j31(jumpaddr[31], PCI[31]);
	buf					j30(jumpaddr[30], PCI[30]);
	buf					j29(jumpaddr[29], PCI[29]);
	buf					j28(jumpaddr[28], PCI[28]);
	buf					j27(jumpaddr[27], in[25]);
	buf					j26(jumpaddr[26], in[24]);
	buf					j25(jumpaddr[25], in[23]);
	buf					j24(jumpaddr[24], in[22]);
	buf					j23(jumpaddr[23], in[21]);
	buf					j22(jumpaddr[22], in[20]);
	buf					j21(jumpaddr[21], in[19]);
	buf					j20(jumpaddr[20], in[18]);
	buf					j19(jumpaddr[19], in[17]);
	buf					j18(jumpaddr[18], in[16]);
	buf					j17(jumpaddr[17], in[15]);
	buf					j16(jumpaddr[16], in[14]);
	buf					j15(jumpaddr[15], in[13]);
	buf					j14(jumpaddr[14], in[12]);
	buf					j13(jumpaddr[13], in[11]);
	buf					j12(jumpaddr[12], in[10]);
	buf					j11(jumpaddr[11], in[9]);
	buf					j10(jumpaddr[10], in[8]);
	buf					j9(jumpaddr[9], in[7]);
	buf					j8(jumpaddr[8], in[6]);
	buf					j7(jumpaddr[7], in[5]);
	buf					j6(jumpaddr[6], in[4]);
	buf					j5(jumpaddr[5], in[3]);
	buf					j4(jumpaddr[4], in[2]);
	buf					j3(jumpaddr[3], in[1]);
	buf					j2(jumpaddr[2], in[0]);
	buf					j1(jumpaddr[1], 1'b0);
	buf					j0(jumpaddr[0], 1'b0);
endmodule
