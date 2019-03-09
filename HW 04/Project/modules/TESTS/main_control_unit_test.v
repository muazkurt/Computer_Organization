`define DELAY 20
module main_control_unit_test();
reg [5:0] opcode, func;

wire	[2:0] select;
wire		branch, 
			alu_mem, 
			memred_en, 
			memwrite_en, 
			immediate_res, 
			shift_select, 
			rd_rt, 
			reg_write, 
			zeroextend, 
			jump, 
			slt_select;


main_control_unit testdata (select, 
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
								slt_select, 
								opcode, 
								func);
initial
begin
opcode = 6'b000000;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b000000;
func = 6'b100000;

#`DELAY;

#`DELAY;
opcode = 6'b100011;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b000100;
func = 6'b000010;

#`DELAY;

#`DELAY;
opcode = 6'b001000;
func = 6'b000001;

#`DELAY;

#`DELAY;
opcode = 6'b000010;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001000;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001000;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001001;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001001;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001001;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001001;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001010;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001011;
func = 6'b000000;

#`DELAY;

#`DELAY;
opcode = 6'b001011;
func = 6'b000000;

#`DELAY;

#`DELAY;
end

initial begin
	 $monitor("opcode= %1b, func= %1b, branch= %1b, alu/mem= %1b, memred_en= %1b, memwrite_en = %1b, immediate_res = %1b, shift = %1b, rd_rt = %1b, regw = %1b, zeroextend = %1b, jump = %1b, slt = %1b", opcode, 
								func, branch, 
								alu_mem, 
								memred_en, 
								memwrite_en, 
								immediate_res, 
								shift_select, 
								rd_rt, 
								reg_write, 
								zeroextend, 
								jump, 
								slt_select);
								
end

endmodule
