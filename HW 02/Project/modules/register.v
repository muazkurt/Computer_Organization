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
	always @(negedge clock)	
	begin
		if(addr1[4] == 1'b1)
		begin
			if(addr1[3] == 1'b1)
			begin
				if(addr1[2] == 1'b1)
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[31];
						end
						else
						begin
							read1 <= regs[30];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[29];
						end
						else
						begin
							read1 <= regs[28];
						end
					end
				end
				else
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[27];
						end
						else
						begin
							read1 <= regs[26];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[25];
						end
						else
						begin
							read1 <= regs[24];
						end
					end
				end
			end 
			else
			begin
				if(addr1[2] == 1'b1)
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[23];
						end
						else
						begin
							read1 <= regs[22];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[21];
						end
						else
						begin
							read1 <= regs[20];
						end
					end
				end
				else
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[19];
						end
						else
						begin
							read1 <= regs[18];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[17];
						end
						else
						begin
							read1 <= regs[16];
						end
					end
				end
			end
		end
		else
		begin
			if(addr1[3] == 1'b1)
			begin
				if(addr1[2] == 1'b1)
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[15];
						end
						else
						begin
							read1 <= regs[14];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[13];
						end
						else
						begin
							read1 <= regs[12];
						end
					end
				end
				else
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[11];
						end
						else
						begin
							read1 <= regs[10];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[9];
						end
						else
						begin
							read1 <= regs[8];
						end
					end
				end
			end 
			else
			begin
				if(addr1[2] == 1'b1)
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[7];
						end
						else
						begin
							read1 <= regs[6];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[5];
						end
						else
						begin
							read1 <= regs[4];
						end
					end
				end
				else
				begin
					if(addr1[1] == 1'b1)
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[3];
						end
						else
						begin
							read1 <= regs[2];
						end
					end
					else
					begin
						if(addr1[0] == 1'b1)
						begin
							read1 <= regs[1];
						end
						else
						begin
							read1 <= regs[0];
						end
					end
				end
			end
		end
		
		if(addr2[4] == 1'b1)
		begin
			if(addr2[3] == 1'b1)
			begin
				if(addr2[2] == 1'b1)
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[31];
						end
						else
						begin
							read2 <= regs[30];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[29];
						end
						else
						begin
							read2 <= regs[28];
						end
					end
				end
				else
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[27];
						end
						else
						begin
							read2 <= regs[26];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[25];
						end
						else
						begin
							read2 <= regs[24];
						end
					end
				end
			end 
			else
			begin
				if(addr2[2] == 1'b1)
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[23];
						end
						else
						begin
							read2 <= regs[22];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[21];
						end
						else
						begin
							read2 <= regs[20];
						end
					end
				end
				else
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[19];
						end
						else
						begin
							read2 <= regs[18];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[17];
						end
						else
						begin
							read2 <= regs[16];
						end
					end
				end
			end
		end
		else
		begin
			if(addr2[3] == 1'b1)
			begin
				if(addr2[2] == 1'b1)
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[15];
						end
						else
						begin
							read2 <= regs[14];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[13];
						end
						else
						begin
							read2 <= regs[12];
						end
					end
				end
				else
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[11];
						end
						else
						begin
							read2 <= regs[10];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[9];
						end
						else
						begin
							read2 <= regs[8];
						end
					end
				end
			end 
			else
			begin
				if(addr2[2] == 1'b1)
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[7];
						end
						else
						begin
							read2 <= regs[6];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[5];
						end
						else
						begin
							read2 <= regs[4];
						end
					end
				end
				else
				begin
					if(addr2[1] == 1'b1)
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[3];
						end
						else
						begin
							read2 <= regs[2];
						end
					end
					else
					begin
						if(addr2[0] == 1'b1)
						begin
							read2 <= regs[1];
						end
						else
						begin
							read2 <= regs[0];
						end
					end
				end
			end
		end
		

	end
	always @(posedge clock)	
	begin
		if(write_enable == 1'b1 && addr3	!= 5'b00000) 
		begin 
			regs[addr3] <= writedata;
		end
		$writememb("memory.mif", regs);
	end
	

		


endmodule
