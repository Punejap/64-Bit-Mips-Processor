`timescale 1ns/1ps
`include "register_file.v"

module register_file_tb();
reg [63:0] read_data_1, read_data_2;
wire[63:0] write_reg_data;
wire[4:0] read_1_addr, read_2_addr,write_addr;
wire regWrite_en, clk, rst;

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

initial begin
    #30  write_addr <= 16;
    #30  write_reg_data <= 42069;


    #20 read_1_addr <= 16;

    #10 regWrite_en = 1;

    #20 clk = 1;



    read_1_addr <= 16;
end

endmodule