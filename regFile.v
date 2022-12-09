module regFile(
        input [5: 0] rs          // read 1
        input [5: 0] rt          // read 2 
        input [5: 0] rd          // output 
        input [5: 0] opcode      // 6 bit opcode
        output[31: 0] read1      //read 1 address
        output[31: 0] read2      //read 2 address
        output[31: 0] regData    // 32 bit register data

)
always @(*)
    //convert rs rt and rd using regdata
    regData regData1(
        .address(rs),
        .data_in(0),
        .data_out(read1)
    );

    regData regData2(
        .address(rt),
        .data_in(0),
        .data_out(read2)
    );

    regData regData3(
        .address(rt),
        .data_in(0),
        .data_out(regData)
    );

    




endmodule