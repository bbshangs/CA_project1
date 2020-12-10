`include "define.v"

module ALU_Control(
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);

input   [9:0]   funct_i;
input   [1:0]   ALUOp_i;
output  [2:0]   ALUCtrl_o;

reg     [2:0]   ALUCtrl_o;

wire funct3;
assign funct3 = funct_i[2:0];

always @(*) begin
	case (ALUOp_i)
		2'b00: //I-type
			if (funct3 == `FUNCT3_ADDI)
				ALUCtrl_o = `ADDI;
			else if (funct3 == `FUNCT3_SRAI)
				ALUCtrl_o = `SRAI;
			else
				ALUCtrl_o = `LWSW;
		2'b01: //BEQ
			ALUCtrl_o = `BEQ;
		2'b10: //R-type
			case (funct_i)
				`FUNCT_AND:
					ALUCtrl_o = `AND;
				`FUNCT_XOR:
					ALUCtrl_o = `XOR;
				`FUNCT_SLL:
					ALUCtrl_o = `SLL;
				`FUNCT_ADD:
					ALUCtrl_o = `ADD;
				`FUNCT_SUB:
					ALUCtrl_o = `SUB;
				`FUNCT_MUL:
					ALUCtrl_o = `MUL;
			endcase
	endcase
end

endmodule
