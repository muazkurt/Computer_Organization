module register(
					read1, 
					read2, 
					addr1, 
					addr2, 
					addr3, 
					writedata, 
					write_enable, 
					clock);
	input						write_enable,
								clock;
	input 		[4:0]		addr1, 
								addr2,
								addr3;
	input			[31:0]	writedata;
	output reg	[31:0]	read1, 
								read2;
	reg			[31:0]	regs		[31:0];
	initial $readmemb("memory.mif", regs);
	always @(negedge clock)	read1 <= regs[addr1];
	always @(posedge clock)	
	begin
		if(write_enable == 1'b1 && addr3	!= 5'b00000) 
		begin 
			regs[addr3] <= writedata;
			$writememb("memory.mif", regs);
		end
	end
	

		


endmodule
