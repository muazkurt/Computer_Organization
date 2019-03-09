`define DELAY 20
module ALUSELECT_testbench();
reg	[2:0]		select;
wire	[31:0]	result;

ALU_SELECT fatb (result, 32'b111, 32'b110, 32'b101, 32'b100, 32'b011, 32'b010, 32'b001, 32'b000, select);


initial begin
select = 3'b000;
#`DELAY;
select = 3'b001;
#`DELAY;
select = 3'b010;
#`DELAY;
select = 3'b011;
#`DELAY;
select = 3'b100;
#`DELAY;
select = 3'b101;
#`DELAY;
select = 3'b110;
#`DELAY;
select = 3'b111;
#`DELAY;
end
 
 
initial
begin
$monitor("time = %2d, select=%1b, result=%1b", $time, select, result);
end
 
endmodule