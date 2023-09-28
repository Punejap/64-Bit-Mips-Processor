`timescale 1ns/1ps
`include "divider.v"

module divider_tb();

wire [63:0] quotient;
wire [127:0] remainder;
wire rdy;
reg [127:0] a,b;
reg rst,clk;

divider M1 (quotient, remainder, rdy, a, b, rst, clk);

always #10 clk = !clk;

initial begin
    $dumpfile("divider.vcd");
    $dumpvars(0, divider_tb);
a = 500;
b = 25;
rst = 1;
clk=1;
#1 rst=0;

while(rdy==0) begin
    @(posedge clk);
end

rst = 1;
#200 $finish;

end

endmodule