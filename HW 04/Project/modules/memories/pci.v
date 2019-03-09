module instrmemread(out, in, clock);
	input								clock;
	input 				[31:0]	in;
	output	reg		[31:0]	out;
	reg		[31:0]	instrMem [31:0];
	initial $readmemb("instrmemory.mif", instrMem);
	always @(negedge clock)
	begin
		out <= instrMem[in];
	end
endmodule
