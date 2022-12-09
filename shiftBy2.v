module ShiftBy2 (out32, in32);

   input [31:0] in32;
   output [31:0] out32;

    assign out32 = {in32[29:0], 2'b00};

endmodule