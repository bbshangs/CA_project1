`include "define.v"

module Control(
	Op_i,
//	NoOp_i, ???????????
	ALUOp_o,
	ALUSrc_o,
	RegWrite_o,
	MemtoReg_o,
    MemRead_o,
    MemWrite_o,
    Branch_o
);

input [6:0] Op_i;
//input NoOp_i;  ?????????

output [1:0] ALUOp_o;
output ALUSrc_o;
output RegWrite_o;
output MemtoReg_o,
output MemRead_o,
output MemWrite_o,
output Branch_o

reg [1:0] ALUOp_o;
reg ALUSrc_o;
reg RegWrite_o;
reg MemtoReg_o,
reg MemRead_o,
reg MemWrite_o,
reg Branch_o

always @(*) begin
	case(Op_i)
		R_OPCODE:
			ALUOp_o = R_ALUOP;
			ALUSrc_o = R_ALUSRC;
			RegWrite_o = R_REGWRITE;
			MemtoReg_o = 1'b0;
			MemRead_o = 1'b0;
			MemWrite_o = 1'b0;
			Branch_o = 1'b0;
		I_OPCODE:
			ALUOp_o = I_ALUOP;
			ALUSrc_o = I_ALUSRC;
			RegWrite_o = I_REGWRITE;
			MemtoReg_o = 1'b0;
			MemRead_o = 1'b0;
			MemWrite_o = 1'b0;
			Branch_o = 1'b0;
		LW_OPCODE:
			ALUOp_o = LW_ALUOP;
			ALUSrc_o = LW_ALUSRC;
			RegWrite_o = LW_REGWRITE;
			MemtoReg_o = 1'b1;
			MemRead_o = 1'b1;
			MemWrite_o = 1'b0;
			Branch_o = 1'b0;
		SW_OPCODE:
			ALUOp_o = SW_ALUOP;
			ALUSrc_o = SW_ALUSRC;
			RegWrite_o = SW_REGWRITE;
			MemtoReg_o = 1'b0;
			MemRead_o = 1'b0;
			MemWrite_o = 1'b1;
			Branch_o = 1'b0;
		BEQ_OPCODE:
			ALUOp_o = BEQ_ALUOP;
			ALUSrc_o = BEQ_ALUSRC;
			RegWrite_o = BEQ_REGWRITE;
			MemtoReg_o = 1'b0;
			MemRead_o = 1'b0;
			MemWrite_o = 1'b0;
			Branch_o = 1'b1;
	endcase
end

endmodule
