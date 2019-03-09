`define DELAY 20
module right_eightShift_testbench(); 
reg [31:0] 	a;
reg			b,
				c;
wire [31:0] result;

right_eight_shift rs (result, a, b);

initial begin
a = 32'b11111111000000001111111100000000; b = 0; c = 0;
#`DELAY;
a = 32'b11111111000000001111111100000000; b = 0; c = 1;
#`DELAY;
a = 32'b11111111000000001111111100000000; b = 1; c = 0;
#`DELAY;
a = 32'b11111111000000001111111100000000; b = 1; c = 1;
#`DELAY;
a = 32'b00000000111111110000000011111111; b = 0; c = 0;
#`DELAY;
a = 32'b00000000111111110000000011111111; b = 0; c = 1;
#`DELAY;
a = 32'b00000000111111110000000011111111; b = 1; c = 0;
#`DELAY;
a = 32'b00000000111111110000000011111111; b = 1; c = 1;
#`DELAY;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, a/l= %1b, result=%1b", $time, a, b, c, result);
end
 
endmodule