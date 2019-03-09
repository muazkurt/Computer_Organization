`define DELAY 20
module memaccess_test();

reg					clock;
reg	[31:0]		addr;
wire	[31:0]		out;

memaccess testdata(out, addr, 31'b0, 1'b0, 1'b1, clock);


initial begin
	clock = 1'b0;
	 for (addr=0; addr<32768; addr=addr+1)
        begin
			#`DELAY;
			clock = ~clock;
			#`DELAY;
			clock = ~clock;
        end
end
 
 
initial
begin
$monitor("time = %1b, out = %1b, addr = %1b", clock, out, addr);
end

endmodule
 