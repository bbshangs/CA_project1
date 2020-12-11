`define PC_ADD 32'd4

`define R_OPCODE 7'b0110011
`define I_OPCODE 7'b0010011
`define LW_OPCODE 7'b0000011
`define SW_OPCODE 7'b0100011
`define BEQ_OPCODE 7'b1100011

`define R_ALUOP 2'b10
`define I_ALUOP 2'b00
`define LW_ALUOP 2'b00
`define SW_ALUOP 2'b00
`define BEQ_ALUOP 2'b01

`define R_ALUSRC 1'b0
`define I_ALUSRC 1'b1
`define LW_ALUSRC 1'b1
`define SW_ALUSRC 1'b1
`define BEQ_ALUSRC 1'b1

`define R_REGWRITE 1'b1
`define I_REGWRITE 1'b1
`define LW_REGWRITE 1'b1
`define SW_REGWRITE 1'b0
`define BEQ_REGWRITE 1'b0

`define FUNCT_AND 10'b0000000_111
`define FUNCT_XOR 10'b0000000_100
`define FUNCT_SLL 10'b0000000_001
`define FUNCT_ADD 10'b0000000_000
`define FUNCT_SUB 10'b0100000_000
`define FUNCT_MUL 10'b0000001_000
`define FUNCT3_ADDI 3'b000
`define FUNCT3_SRAI	3'b101

`define AND 3'b000
`define XOR 3'b001
`define SLL 3'b011
`define ADD 3'b010
`define SUB 3'b110
`define MUL 3'b111
`define ADDI 3'b101
`define SRAI 3'b100
`define LWSW 3'b010
`define BEQ 3'b110
