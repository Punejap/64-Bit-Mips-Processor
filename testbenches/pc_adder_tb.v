`timescale 1ns/1ps
`include "pc_adder.v"

module pc_adder_tb;
wire[63:0] address;
reg[63:0] imm_gen;
reg mux_en, clk, rst;

pc_adder m1(address, imm_gen, mux_en, clk, rst);

always begin
    #10 clk = ~clk;
end

initial begin
    #1000 $finish;
end

initial begin
    $dumpfile("pc_adder_tb.vcd");
    $dumpvars(0, pc_adder_tb);
    mux_en <= 0;
    clk <= 0;
    #300 
    
        imm_gen <='d567877678553;
        mux_en <= 'b1;
        #20
    mux_en = 'b0;
end

endmodule
