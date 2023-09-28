`timescale 1ps/1ps
`include "two_one_mux.v"

module mux_tb;
wire[63:0] data_out;
reg[63:0] in_0, in_1;
reg en;

two_one_mux m1(data_out, in_0, in_1, en);

initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0, mux_tb);

    in_0 <= 'd4213;
    in_1 <= 'd69230;
    #10 en<=1;
    #10 en<=0;
    #10 en<=1;
    #10 en<=0;
    #10 en<=1;
    #10 en<=0;
    #10 en<=1;
    #10 en<=0;
end

endmodule