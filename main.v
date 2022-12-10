module cpu( input [31:0] instruction);


//make a instructionMemory module
//declare the variables
reg [5:0] rs;
reg [5:0] rt;
reg [5:0] rd;
reg [5:0] opcode;

//run one at a time
always @(*)
instructionMem instructionMemory(
    .instruction(instruction)
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .opcode(opcode)
);


//declare the variables for the regFile
reg [31:0] read1;
reg [31:0] read2;
reg [31:0] regData;

//make a regFile module
regFile regFile(
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .opcode(opcode)
    .read1(read1),
    .read2(read2),
    .regData(regData)
);


//make alu
alu alu(
    .A(opcode),
    .B(read1),
    .read2(read2),
    .regData(regData)
);


endmodule