`timescale 1ns/1ps
`include "instrMem.v"

module instrMem_tb;

wire [31:0] instruction;
reg[63:0] address;

instrMem m1(instruction, address);

reg clk;

always begin
#5 clk = ~clk;
end

always@(posedge clk)begin
    address <= address + 'd4;
end

initial begin
    #100 $finish;
end

initial begin
    $dumpfile("instrMem.vcd");
    $dumpvars(0, instrMem_tb);
    clk <= 0;
    address <= 'd40;
end

endmodule