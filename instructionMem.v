module instructionMem(
        input  [31: 0] instruction  // 32 bit instruction
        output [5: 0] rs          // 32 bit read 1
        output [5: 0] rt          // 32 bit  read 2 
        output [5: 0] rd     
        output [5: 0] opcode        // 6 bit opcode
);
assign opcode = instruction[31: 26];
reg jump

case(opcode)
    //add  //subtract   
   100000 , 100010: begin
                        rs <= instruction[25: 21];
                        rt <= instruction[20: 16];
                        rt <= instruction[15: 11];
                     end;
    //jump
   000010: begin
                rs <= 0;
                rt <= 0;
                rd <= 0;
                jump <= 1;
            end

      
   //error
   default: begin
                opcode <= 0;
                rs = 0;
                rt = 0;
                rd = 0;
             end 
   

   reg [31:0] signAndCarry;
   
   
   signExtend signExtend(
       .in26(instruction[25:0])
       .out32(signAndCarry),
   );

   reg [31:0] out32;

   //shift left
   shiftBy2 shiftBy2(
       .in32(signAndCarry),
       .out32(out32)
   );

   //declare the adder
   //we can use the same out32
   adder adder(
       .in1(out32),
       .in2(instruction[25:0]),
       .carry(signAndCarry[31]),
       .out(out32)
   );

   //jump mux
   //reuse isntruction to feed back instruction
   mux mux(
       .in1(out32),
       .in2(instruction[25:0]),
       .sel(opcode[5]),
       .out(instruction)
   );
   
endcase



endmodule