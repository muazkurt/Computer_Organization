`define DELAY 20
module muxII_testbench(); 
reg a, b, select;
wire result;

muxII io (result, a, b, select);

initial begin
a = 1'b0; b = 1'b0; select = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b0; select = 1'b1;
#`DELAY;
a = 1'b0; b = 1'b1; select = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b1; select = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b0; select = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b0; select = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b1; select = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b1; select = 1'b1;
end
 
 
initial
begin
$monitor("time = %2d, a =%1b, b=%1b, select=%1b, result=%1b", $time, a, b, select, result);
end
 
endmodule