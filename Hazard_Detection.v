module Hazard_Detection
(
    data1_i,
    data2_i,
    data3_i,
    MemRead_i,
    PCWrite_o,
    Stall_o
);

input   [31:0]  data1_i;
input   [31:0]  data2_i;
input   [31:0]  data3_i;
input           MemRead_i;
output          PCWrite_o;
output          Stall_o;

reg             PCWrite_o;
reg             Stall_o;

always @(*) begin
    if (MemRead_i && (data1_i == data3_i || data2_i == data3_i))
        PCWrite_o <= 1'b0; // don't update PC
        Stall_o <= 1'b1; // do stall
    else
        PCWrite_o <= 1'b1;
        Stall_o <= 1'b0;
end

endmodule
