module regData (
  input wire [5:0] address,
  input wire [31:0] data_in,
  output reg [31:0] data_out
);

    // Declare register array   
    reg [31:0] registers [0:63];

  // Write data to the specified register
  registers[address] <= data_in;
  
  // Read data from the specified register
  data_out <= registers[address];

endmodule
