`define DELAY 20
module right_fourShift_testbench(); 
reg [31:0] 	a;
reg			b,
				c;
wire [31:0] result;

right_four_shift rs (result, a, b);

initial begin
a = 32'b11110000111100001111000011110000; b = 0; c = 0;
#`DELAY;
a = 32'b11110000111100001111000011110000; b = 0; c = 1;
#`DELAY;
a = 32'b11110000111100001111000011110000; b = 1; c = 0;
#`DELAY;
a = 32'b11110000111100001111000011110000; b = 1; c = 1;
#`DELAY;
a = 32'b00001111000011110000111100001111; b = 0; c = 0;
#`DELAY;
a = 32'b00001111000011110000111100001111; b = 0; c = 1;
#`DELAY;
a = 32'b00001111000011110000111100001111; b = 1; c = 0;
#`DELAY;
a = 32'b00001111000011110000111100001111; b = 1; c = 1;
#`DELAY;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, a/l= %1b, result=%1b", $time, a, b, c, result);
end
 
endmodule