`include "define.v"

module ALU_Control(
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);

input [9:0] funct_i;
input [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;

wire funct3;
assign funct3 = funct_i[2:0];

always @(*) begin
	case (ALUOp_i)
		2'b00: //I-type
			if (funct3 == FUNCT3_ADDI)
				ALUCrtl_o = ADDI;
			else if (functr == FUNCT3_SRAI)
				ALUCrtl_o = SRAI;
			else
				ALUCrtl_o = LWSW;
		2'b01: //BEQ
			ALUCrtl_o = BEQ;
		2'b10: //R-type
			case (funct_i)
				FUNCT_AND:
					ALUCrtl_o = AND;
				FUNCT_XOR:
					ALUCrtl_o = XOR;
				FUNCT_SLL:
					ALUCrtl_o = SLL;
				FUNCT_ADD:
					ALUCrtl_o = ADD;
				FUNCT_SUB:
					ALUCrtl_o = SUB;
				FUNCT_MUL:
					ALUCrtl_o = MUL;
			endcase
	endcase
end

endmodule
