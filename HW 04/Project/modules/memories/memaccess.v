module memaccess(result,
					addr, 
					write_data,
					write_enable,
					read_enable,
					clock);
	input						write_enable,
								read_enable,
								clock;
	input 		[31:0]	addr,
								write_data;
	output reg	[31:0]	result;
	reg			[31:0]	regs		[1024:0];

	initial 
	begin
		$readmemb("mainmemory.mif", regs);
	end
	
	always @(negedge clock)
	begin
		if(read_enable == 1'b1)
		begin
			$readmemb("mainmemory.mif", regs);
			result <= regs[addr];
		end
	end

	always @(posedge clock)	
	begin
		if(write_enable == 1'b1) 
		begin
			regs[addr] <= write_data;
			$writememb("mainmemory.mif", regs);
		end
	end

endmodule
