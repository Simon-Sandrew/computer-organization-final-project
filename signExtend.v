module signExtend (out32, in26);
    input [26:0] in26;
    output [31:0] out32;
    assign out32 = {{26{in26[5]}},in26};
endmodule