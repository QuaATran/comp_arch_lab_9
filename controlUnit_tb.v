module controlUnit_tb ();
	
	reg [31:0] instruction;
	reg zero;
	
	wire [1:0] immSel;
	wire [2:0] ALUop;
	wire ALUsrc, memReadWrite, memToReg, PCsrc, RegWrite;
	
	controlUnit a (immSel, ALUop, PCsrc, ALUsrc, memReadWrite, memToReg, RegWrite, instruction, zero);
	
	initial begin
		instruction = 32'h00000000;
		zero = 0;
	end
	
	always begin
		#20 instruction = 32'h00a00293;
		#20 instruction = 32'h00f00313;
		#20 instruction = 32'h01400393;
		#20 instruction = 32'h00628863;
		#20 instruction = 32'h00736433;
		#20 instruction = 32'h00129293;
		#20 instruction = 32'h00602223;
		#20 instruction = 32'h00402483;
		#20 instruction = 32'h04728863;
			 zero = 1;
		#20 instruction = 32'h00648533;
			 zero = 0;
		#20 instruction = 32'hffb30493;
		#20 instruction = 32'h00a02423;
	end

	initial #250 $stop;

endmodule