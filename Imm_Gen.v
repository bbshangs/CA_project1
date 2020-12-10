`include "define.v"

module Imm_Gen(
	data_i,
	data_o
);

input [31:0] data_i;
output [31:0] data_o;

wire [6:0] opcode;
assign opcode = data_i[6:0];

wire [11:0] imme;

assign imme = (opcode == I_OPCODE)? data_i[31:20]:
			(opcode == LW_OPCODE)? data_i[31:20]:
			(opcode == SW_OPCODE)? {data_i[31:25], data_i[11:7]}:
			{data_i[31], data_i[7], data_i[30:25], data_i[11:8]};

assign data_o = {{20{imme[11]}}, imme[11:0]};

endmodule