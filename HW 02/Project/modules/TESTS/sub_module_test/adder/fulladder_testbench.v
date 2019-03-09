`define DELAY 20
module fulladder_testbench(); 
reg 	a, b, c_in; 
wire	result, and_r, or_r, xor_r, c_out;

full_adder fatb (result, and_r, or_r, xor_r, c_out, a, b, c_in);

initial begin
a = 1'b0; b = 1'b0; c_in = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b0; c_in = 1'b1;
#`DELAY;
a = 1'b0; b = 1'b1; c_in = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b1; c_in = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b0; c_in = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b0; c_in = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b1; c_in = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b1; c_in = 1'b1;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, c_in=%1b, result=%1b, and_r=%1b, or_r=%1b, xor_r=%1b, c_out=%1b", $time, a, b, c_in, result, and_r, or_r, xor_r, c_out);
end
 
endmodule