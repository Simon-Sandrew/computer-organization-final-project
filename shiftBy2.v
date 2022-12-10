module ShiftBy2 (in32, out32);

   input [31:0] in32;
   output reg [31:0] out32;

   always @(N, D) begin
      reg [1:0] N = 2'b10;
      Q = D >> N;
   end

endmodule