`define DELAY 20
module right_twoShift_testbench(); 
reg [31:0] 	a;
reg			b,
				c;
wire [31:0] result;

right_two_shift rs (result, a, b);

initial begin
a = 32'b11001100110011001100110011001100; b = 0; c = 0;
#`DELAY;
a = 32'b11001100110011001100110011001100; b = 0; c = 1;
#`DELAY;
a = 32'b11001100110011001100110011001100; b = 1; c = 0;
#`DELAY;
a = 32'b11001100110011001100110011001100; b = 1; c = 1;
#`DELAY;
a = 32'b00110011001100110011001100110011; b = 0; c = 0;
#`DELAY;
a = 32'b00110011001100110011001100110011; b = 0; c = 1;
#`DELAY;
a = 32'b00110011001100110011001100110011; b = 1; c = 0;
#`DELAY;
a = 32'b00110011001100110011001100110011; b = 1; c = 1;
#`DELAY;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, a/l= %1b, result=%1b", $time, a, b, c, result);
end
 
endmodule