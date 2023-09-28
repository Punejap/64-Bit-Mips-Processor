
module two_one_mux(
    output wire [63:0] data_out,
    input wire [63:0] in_0, in_1,
    input wire en
    );

assign data_out = (en==1) ? in_1 : in_0;

endmodule
