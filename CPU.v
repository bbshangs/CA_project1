`include "define.v"

module CPU
(
    clk_i,
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

//yufeng
Control Control(
    .Op_i       (),
    .NoOp_i     (),
    .ALUOp_o    (),
    .ALUSrc_o   (),
    .RegWrite_o (),
    .MemtoReg_o (),
    .MemRead_o  (),
    .MemWrite_o (),
    .Branch_o   ()
);

//grace
Adder Add_PC(
    .data1_i   (),
    .data2_i   (),
    .data_o     ()
);

//grace
Adder Add_PC_Branch(
    .data1_i   (),
    .data2_i   (),
    .data_o    ()
);

//ta
PC PC(
    .clk_i      (),
    .rst_i      (),
    .start_i    (),
    .PCWrite_i  (),
    .pc_i       (),
    .pc_o       ()
);

//ta
Instruction_Memory Instruction_Memory(
    .addr_i     (),
    .instr_o    ()
);

//ta
Registers Registers(
    .clk_i      (),
    .RS1addr_i   (),
    .RS2addr_i   (),
    .RDaddr_i   (),
    .RDdata_i   (),
    .RegWrite_i (),
    .RS1data_o   (),
    .RS2data_o   ()
);

//yufeng
MUX32 MUX_ALUSrc(
    .data1_i    (),
    .data2_i    (),
    .select_i   (),
    .data_o     ()
);

//yufeng
MUX32 MUX_Mem2Reg(
    .data1_i   (),
    .data2_i   (),
    .select_i   (),
    .data_o     ()
);

//yufeng
MUX32 MUX_PCSource(
    .data1_i   (),
    .data2_i   (),
    .select_i   (),
    .data_o     ()
);

//bb
MUX2 MUX_A(
    .data0_i  (),
    .data1_i  (),
    .data2_i  (),
    .forward_i (),
    .data_o    ()
);

//bb
MUX2 MUX_B(
    .data0_i  (),
    .data1_i  (),
    .data2_i  (),
    .forward_i (),
    .data_o    ()
);

//yufeng
Imm_Gen Imm_Gen(
    .data_i     (),
    .data_o     ()
);

//yufeng
ALU ALU(
    .data1_i    (),
    .data2_i    (),
    .ALUCtrl_i  (),
    .data_o     ()
);

//yufeng
ALU_Control ALU_Control(
    .funct_i    (),
    .ALUOp_i    (),
    .ALUCtrl_o  ()
);

//ta
Data_Memory Data_Memory(
    .clk_i      (),
    .addr_i     (),
    .MemRead_i  (),
    .MemWrite_i (),
    .data_i     (),
    .data_o     ()
);

//grace
Hazard_Detection Hazard_Detection(
    .data1_i    (),
    .data2_i    (),
    .data3_i    (),
    .MemRead_i  (),
    .PCWrite_o  (),
    .Stall_o    (),
    .NoOp_o     ()
);

//bb
Forward_Unit Forward_Unit(
    .MemRegWrite_i  (),
    .MemRd_i        (),
    .WBRegWrite_i   (),
    .WBRd_i         (),
    .EXRs1_i        (),
    .EXRs2_i        (),
    .ForwardA_o     (),
    .ForwardB_o     ()
);

//yufeng
IFID IFID(
    .clk_i      (),
    .Stall_i    (),
    .Flush_i    (),
    .PC_i       (),
    .instr_i    (),
    .PC_o       (),
    .instr_o    ()
);

//yufeng
IDEX IDEX(
    .clk_i      (),
    // Control Input 
    .ALUOp_i    (),
    .ALUSrc_i   (),
    .RegWrite_i (),
    .MemtoReg_i (),
    .MemRead_i  (),
    .MemWrite_i (),
    // Register Data Input
    .data1_i    (),
    .data2_i    (),
    .imm_i      (),
    .funct_i    (),
    .RS1addr_i  (),
    .RS2addr_i  (),
    .RDaddr_i   (),
    // Control Output 
    .ALUOp_o    (),
    .ALUSrc_o   (),
    .RegWrite_o (),
    .MemtoReg_o (),
    .MemRead_o  (),
    .MemWrite_o (),
    // Register Data Output
    .data1_o    (),
    .data2_o    (),
    .imm_o      (),
    .funct_o    (),
    .RS1addr_o  (),
    .RS2addr_o  (),
    .RDaddr_o   ()
);

//yufeng
EXMEM EXMEM(
    .clk_i          (),
    .RegWrite_i     (),
    .MemtoReg_i     (),
    .MemRead_i      (),
    .MemWrite_i     (),
    .ALUResult_i    (),
    .MUX_B_i        (),
    .RDaddr_i       (),
    .RegWrite_o     (),
    .MemtoReg_o     (),
    .MemRead_o      (),
    .MemWrite_o     (),
    .ALUResult_o    (),
    .MUX_B_o        (),
    .RDaddr_o       ()
);

//yufeng
MEMWB MEMWB(
    .clk_i          (),
    .RegWrite_i     (),
    .MemtoReg_i     (),
    .ALUResult_i    (),
    .ReadData_i     (),
    .RDaddr_i       (),
    .RegWrite_o     (),
    .MemtoReg_o     (),
    .ALUResult_o    (),
    .ReadData_o     (),
    .RDaddr_o       ()
);

//grace
If_Branch If_Branch(
    .data1_i    (),
    .data2_i    (),
    .Branch_i   (),
    .data_o     ()
);

endmodule
