module alu(
           input [31:0] A,B,  // ALU 8-bit Inputs                 
           input wire ALU_Sel,// ALU 1 bit Selection
           output [31:0] ALU_Out, // ALU 8-bit Output
    );
    reg [31:0] ALU_Result;
    wire [31:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    always @(*)
    begin
        case(ALU_Sel)
        0: // Addition
           ALU_Result = A + B ; 
        1: // Subtraction
           ALU_Result = A - B ;
        default: ALU_Result = A + B ; 
        endcase
    end

endmodule