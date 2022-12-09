module instructionMem(
        input  [31: 0] instruction  // 32 bit instruction
        output [5: 0] rs          // 32 bit read 1
        output [5: 0] rt          // 32 bit  read 2 
        output [5: 0] rd     
        output [5: 0] opcode        // 6 bit opcode
);
assign opcode = instruction[31: 26];

case(opcode)
    //add  //subtract   
    100000 , 100010: begin
                        rs = instruction[25: 21];
                        rt = instruction[20: 16];
                        rt = instruction[15: 11];
                     end;
    //jump
    000010: begin
                rs = 0;
                rt = 0;
                rd = 0;
             end
    //error
    default: begin
                opcode = 0;
                rs = 0;
                rt = 0;
                rd = 0;
             end 
endcase
endmodule