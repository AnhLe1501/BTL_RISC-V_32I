module testbench3();
	logic clk, reset, MemWrite;
	logic [31:0] WriteData, DataAdr;

	top dut(clk, reset, WriteData, DataAdr, MemWrite);
	
	initial
		begin
			reset <= 1; 
			# 100; 
			reset <= 0;
			
			$display("Simulation starts!");
			$monitor("Value of ALU = %d", DataAdr);
		end
	


	always
		begin
			clk <= 1; 
			# 5; clk <= 0; # 5;
		end
		
	always @(negedge clk)
		begin
			if(MemWrite) begin
				if(DataAdr === 132 & WriteData === 32'hABCDE02E) begin
					$display("Simulation succeeded");
					$stop;
				end	
			end
		end
endmodule