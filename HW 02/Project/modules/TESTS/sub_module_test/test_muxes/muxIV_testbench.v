`define DELAY 20
module muxIV_testbench(); 
reg a, b, c, d;
reg [1:0] select;
wire result;

muxIV iiiiiio (result, a, b, c, d, select);

initial begin
a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b00;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b00;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b00;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b00;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b00;
#`DELAY;


a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b01;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b01;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b01;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b01;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b01;
#`DELAY;


a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b10;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b10;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b10;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b10;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b10;
#`DELAY;


a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b11;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b11;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b11;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; select = 2'b11;
#`DELAY;
a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; select = 2'b11;
#`DELAY;
end


initial
begin
$monitor("time = %2d, a =%1b, b=%1b, c=%1b, d=%1b, select=%1b, result=%1b", $time, a, b, c, d, select, result);
end
 
endmodule