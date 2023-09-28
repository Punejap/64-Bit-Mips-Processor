`timescale 1ns/1ps
`include "register_file.v"

module register_file_tb();
wire [63:0] read_data_1, read_data_2;
reg[63:0] write_reg_data;
reg[4:0] read_1_addr, read_2_addr,write_addr;
reg regWrite_en, clk, rst;

register_file m1 (
    read_data_1,
    read_data_2,
    write_reg_data,
    read_1_addr,
    read_1_addr,
    write_addr,
    regWrite_en,
    clk,
    rst
    );

always begin
    #10 clk = ~clk;
end

initial begin
    #1000 $finish;
end

initial begin

    $dumpfile("reg.vcd");
    $dumpvars(0, register_file_tb);
    clk = 0;
    #30  write_addr <= 16;
    #30  write_reg_data <= {6'h23, 5'd29, 5'd4, 16'h0000};


    #20 read_1_addr <= 16;

    #10 regWrite_en = 1;

    #10 rst = 1;
end

endmodule