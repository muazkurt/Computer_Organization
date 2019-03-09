`define DELAY 20
module regisers_testbench();
reg				clock,
					write_en;
reg	[4:0]		r1,
					r2,
					r3;
wire	[31:0]	rs,
					rt;

register testdata	(rs, rt, r1, r2, r3, rs, write_en, clock);


initial begin
	write_en = 1'b1;
	clock = 1'b0;
	r1 = 5'b00001;
	r2 = 5'b00010;
	r3 = 5'b00001;
	
	#`DELAY;
	clock = ~clock;
	#`DELAY;
	clock = ~clock;
	r1 = 5'b00011;
	r2 = 5'b00100;
	
	#`DELAY;
	clock = ~clock;
	#`DELAY;
	clock = ~clock;
	r1 = 5'b00101;
	r2 = 5'b00110;
	r3 = 5'b00000;
	
	#`DELAY;
	clock = ~clock;
	#`DELAY;
	clock = ~clock;
	r1 = 5'b00111;
	r2 = 5'b01000;
	r3 = 5'b00101;
	write_en = ~write_en;
	#`DELAY;
	clock = ~clock;
	#`DELAY;
	clock = ~clock;
	
	r1 = 5'b01001;
	r2 = 5'b01010;
	r3 = 5'b01001;
	#`DELAY;
	clock = ~clock;
	#`DELAY;
	clock = ~clock;
	r1 = 5'b01011;
	r2 = 5'b01100;
	
	#`DELAY;
	clock = ~clock;
	#`DELAY;
	clock = ~clock;
	
	write_en = ~write_en;
	r1 = 5'b01101;
	r2 = 5'b01110;
	
	#`DELAY;
	clock = ~clock;
	#`DELAY;
	clock = ~clock;
end
 
 
initial
begin
$monitor("time = %1b, R[%1b]=%1b, R[%1b]=%1b, R[%1b]=%1b, write enable = %1b", clock, r1, rs, r2, rt, r3, testdata.regs[r3], write_en);
end
 
endmodule