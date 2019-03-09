`define DELAY 20
module mips32_single_cycle_test();
reg				clock;
reg	[10:0]	i;
mips32_single_cycle testdata(clock);


initial begin
	testdata.PCI = 32'b0;
	clock = 1'b0;
	for(i = 0; i < 20; i = i + 1)
		begin
			#`DELAY;
			clock = ~clock;
			#`DELAY;
			clock = ~clock;
	  end
end
 
 
initial
begin
$monitor("time = %1b, PCI = %1b, P[PCI] = %1b", clock, testdata.PCI, testdata.in);
end

endmodule
 