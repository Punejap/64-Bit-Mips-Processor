module ALUSrcMux(
    output[63:0] out,
    input[63:0] read_data_2, ImmGen,
    input ALUSrc
);

assign out = ALUSrc ? ImmGen:read_data_2;
endmodule