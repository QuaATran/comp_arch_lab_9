module controlUnit (immSel, ALUop, PCsrc, ALUsrc, memReadWrite, memToReg, RegWrite, instruction, zero);

 input  [31:0] instruction;
 input zero;
 
 output reg PCsrc, ALUsrc, memReadWrite, memToReg, RegWrite;
 output reg [1:0] immSel;
 output reg [2:0] ALUop;

 wire [3:0] opcode;
	assign opcode = {{instruction[13:12]}, {instruction[5:4]}};
	
	always @ (*) begin
		case(opcode)
			4'b0011: begin
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b000;
				memReadWrite = 1'b0;
				memToReg = 1'b1;
				PCsrc = 1'b0;
				RegWrite = 1'b1;
			end
			
			4'b1011: begin
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b001;
				memReadWrite = 1'b0;
				memToReg = 1'b1;
				PCsrc = 1'b0;
				RegWrite = 1'b1;
			end
				
			4'b0111: begin
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b010;
				memReadWrite = 1'b0;
				memToReg = 1'b1;
				PCsrc = 1'b0;
				RegWrite = 1'b1;
			end
			
			4'b0001: begin
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b000;
				memReadWrite = 1'b0;
				memToReg = 1'b1;
				PCsrc = 1'b0;
				RegWrite = 1'b1;
			end
			
			4'b1001: begin
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b001;
				memReadWrite = 1'b0;
				memToReg = 1'b1;
				PCsrc = 1'b0;
				RegWrite = 1'b1;
			end
				
			4'b0101: begin
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b010;
				memReadWrite = 1'b0;
				memToReg = 1'b1;
				PCsrc = 1'b0;
				RegWrite = 1'b1;
			end
				
			4'b1000: begin
				immSel = 2'b01;
				ALUsrc = 1'b1;
				ALUop = 3'b000;
				memReadWrite = 1'b0;
				memToReg = 1'b0;
				PCsrc = 1'b0;
				RegWrite = 1'b1;
			end
			
			4'b1010: begin
				immSel = 2'b10;
				ALUsrc = 1'b1;
				ALUop = 3'b000;
				memReadWrite = 1'b1;
				memToReg = 1'b0;
				PCsrc = 1'b0;
				RegWrite = 1'b0;
			end
				
			4'b0010: begin
				immSel = 2'b11;
				ALUsrc = 1'b0;
				ALUop = 3'b011;
				memReadWrite = 1'b0;
				memToReg = 1'b1;
				PCsrc = zero;
				RegWrite = 1'b0;
			end
			
			default: begin
				immSel = 2'b00;
				ALUsrc = 1'b0;
				ALUop = 3'b000;
				memReadWrite = 1'b0;
				memToReg = 1'b0;
				PCsrc = 1'b0;
				RegWrite = 1'b0;
			end
				
		endcase
	end
 
endmodule 