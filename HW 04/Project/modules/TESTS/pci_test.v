`define DELAY 20
module pci_test();
reg					clock;
reg	[31:0]		addr;
wire	[31:0]		out;

instrmemread testdata(out, addr, clock);


initial begin
	clock = 1'b0;
	 for (addr=0; addr < 32; addr=addr+1)
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