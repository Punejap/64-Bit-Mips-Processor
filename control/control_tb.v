`timescale 1ns/1ps
`include "control.v"

module control_tb();
wire branch, memWrite, memRead, regWrite, memToReg,  ALUsrc;
wire[1:0] ALUOp;
reg [6:0] instr;
reg clk;

control UUT (ALUOp, branch, memWrite, memRead, regWrite, memToReg,  ALUsrc,instr, clk );


initial begin
    $dumpfile("control.vcd");
    $dumpvars(0,control_tb);
instr[6:0] = 7'h33;
#50 clk = 1;
clk = 0;

instr[6:0] = 7'h33;
#50 clk = 1;
clk = 0;

instr[6:0] = 7'h3;
#50 clk = 1;
clk = 0;

instr[6:0] = 7'h47;
#50 clk = 1;
clk = 0;
#20;

instr[6:0] = 7'h5;
#50 clk = 1;
clk = 0;
#20;

end

endmodule