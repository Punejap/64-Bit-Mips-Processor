`timescale 1ns/1ps
`include "divider.v"

module divider_tb();

wire [63:0] quotient;
wire [63:0] remainder;
wire rdy;
reg [63:0] a,b;

divider M1 (quotient, remainder, rdy, a, b);


initial begin // Time Out
#10000 $finish; // Stopwatch
end

initial begin
    $dumpfile("divider.vcd");
    $dumpvars(0, divider_tb);
a <= 26;
b <= 4;

end

endmodule