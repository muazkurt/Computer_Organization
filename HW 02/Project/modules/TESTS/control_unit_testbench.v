`define DELAY 20
module control_unit_testbench();
	reg	[5:0]	fun_code;
	wire			slt,
					shift,
					write_en;
	wire	[2:0] alu_select;
	
	control_unit test(alu_select, shift, slt, write_en, fun_code);

	initial
	begin
	fun_code = 6'b100000;
	#`DELAY;
	fun_code = 6'b100001;
	#`DELAY;
	fun_code = 6'b101000;
	#`DELAY;
	fun_code = 6'b000000;
	#`DELAY;
	fun_code = 6'b000010;
	#`DELAY;
	fun_code = 6'b100100;
	#`DELAY;
	fun_code = 6'b100101;
	#`DELAY;
	fun_code = 6'b101010;
	#`DELAY;
	fun_code = 6'b101011;
	#`DELAY;
	fun_code = 6'b100010;
	#`DELAY;
	fun_code = 6'b100011;
	#`DELAY;
	
	fun_code = 6'b010001;
	#`DELAY;
	fun_code = 6'b010011;
	#`DELAY;
	end
	
	
	initial $monitor("func_code= %1b, alu= %1b, shift= %1b, slt= %1b, write_en= %1b", fun_code, alu_select, shift, slt,write_en);
	
	
endmodule