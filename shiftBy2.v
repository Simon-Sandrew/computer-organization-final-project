module ShiftBy2 (D, Q);

   input [31:0] D;
   output reg [31:0] Q;

   always @(N, D) begin
      reg [1:0] N = 2'b10;
      Q = D >> N;

   end
endmodule