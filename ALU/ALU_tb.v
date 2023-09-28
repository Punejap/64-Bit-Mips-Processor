`timescale  1ns / 1ps  
`include "ALU.v"


module ALU_tb();
wire[127:0] result, mul, div;
wire[63:0] add, sub;
wire zero;
reg[63:0] read_data_1, reg_mux;
reg[3:0] opcode;

ALU UUT ( result, zero, c_out, read_data_1, reg_mux, opcode, reset);


initial
begin
    $dumpfile("ALU.vcd");
    $dumpvars(0,ALU_tb);
    #5 read_data_1 <= 53;
    #5 reg_mux <= 100;
    #20 opcode <= 4'b0010;  //add
    #40
    #5 read_data_1 <= 545;
    #5 reg_mux <= 545;
    #20 opcode <= 4'b0110;  //sub
    #40
    #5 read_data_1 <= 600;
    #5 reg_mux <= 54;
    #20 opcode <= 4'b1000;  //mul
    #40
    #5 read_data_1 <= 500;
    #5 reg_mux <= 20;
    #20 opcode <= 4'b0011;  //div
    #40
    #5 read_data_1 <= 8'b11001101;
    #5 reg_mux <= 8'b11100110;
    #20 opcode <= 4'b0000;      //and
    #40
    #5 read_data_1 <= 8'b11001101;
    #5 reg_mux <= 8'b11100110;
    #20 opcode <= 4'b0001;  //or
    #1000;
    $finish;
end

endmodule