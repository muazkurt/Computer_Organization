module mips32(branch_result, rsaddr, rtaddr, rt_rd_chosen,
					shiftImm, S_ZextendImm, shift_select, 
					slt_select, alubits, reg_write, memread,
					memwrite, alu_mem, immediate_res, clock);
	output			branch_result;
	wire 	[31:0]	rs,
						rt,
						aluLeft,
						aluRightLI, aluRight,
						alu_out, slt_result,
						alu_result, memory_result,
						result;
	input				shift_select,
						slt_select,
						reg_write,
						memread, 
						memwrite, 
						alu_mem,
						clock,
						immediate_res;
	input	[2:0]		alubits;
	input	[4:0]		rsaddr,
						rtaddr,
						rt_rd_chosen;
	input [31:0]	shiftImm, 
						S_ZextendImm;

						
	register				parse			(rs, rt, rsaddr, rtaddr, rt_rd_chosen, result, reg_write, clock);
	
	selecterXXXI		rsrtselect	(aluLeft, rt, rs, shift_select);
	selecterXXXI		rightL1		(aluRightLI, shiftImm, rt, shift_select);	
	selecterXXXI		rightEnd		(aluRight, S_ZextendImm, aluRightLI, immediate_res);
	
	ALU 					operation	(alu_out, aluLeft, aluRight, alubits);
	
	extend_XXXII		isless		(slt_result, alu_out[31]);
	selecterXXXI		out_select	(alu_result, slt_result, alu_out, slt_select);
	
	
	memaccess			rw				(memory_result, alu_out, rs, memread, memwrite, clock);
	
	selecterXXXI		oputfind		(result, memory_result, alu_result, alu_mem);
	buf					slt			(branch_result, alu_out[31]);
endmodule
	