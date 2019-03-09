`define DELAY 20
module adder_testbench(); 
reg [31:0] 	a,	b;
reg			c_in;
wire [31:0] result, and_r, or_r, xor_r;
wire 			c_out;

adder fatb (result, and_r, or_r, xor_r, c_out, a, b, c_in);


initial begin
a = 32'b10101010101010101010101010101010; b = 32'b1;  c_in = 0;
#`DELAY;
a = 32'b10101010101010101010101010101010; b = 32'b1; c_in = 1;
#`DELAY;
a = 32'b0; b = 32'b1;  c_in = 0;
#`DELAY;
a = 32'b0; b = 32'b1; c_in = 1;
#`DELAY;
a = 32'b11111111111111111111111111111111; b = 32'b1;  c_in = 0;
#`DELAY;
a = 32'b11111111111111111111111111111111; b = 32'b1; c_in = 1;
#`DELAY;
a = 32'b1; b = 32'b10101010101010101010101010101010;  c_in = 0;
#`DELAY;
a = 32'b1; b = 32'b10101010101010101010101010101010; c_in = 1;
#`DELAY;
a = 32'b1; b = 32'b0;  c_in = 0;
#`DELAY;
a = 32'b1; b = 32'b0; c_in = 1;
#`DELAY;
a = 32'b1; b = 32'b11111111111111111111111111111111;  c_in = 0;
#`DELAY;
a = 32'b1; b = 32'b11111111111111111111111111111111; c_in = 1;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, c_in=%1b, result=%1b, and_r=%1b, or_r=%1b, xor_r=%1b, c_out=%1b", $time, a, b, c_in, result, and_r, or_r, xor_r, c_out);
end
 
endmodule