`include "define.v"

module ALU(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o
);

input   signed  [31:0]  data1_i;
input   signed  [31:0]  data2_i;
input           [2:0]   ALUCtrl_i;
output  signed  [31:0]  data_o;

reg     signed  [31:0]  data_o;

always @(*) begin
	case (ALUCtrl_i)
		`AND: data_o = data1_i & data2_i;
		`XOR: data_o = data1_i ^ data2_i;
		`SLL: data_o = data1_i << data2_i;
		`ADD: data_o = data1_i + data2_i;
		`SUB: data_o = data1_i - data2_i;
		`MUL: data_o = data1_i * data2_i;
		`ADDI: data_o = data1_i + data2_i;
		`SRAI: data_o = data1_i >>> data2_i[4:0];
	endcase
end

endmodule
