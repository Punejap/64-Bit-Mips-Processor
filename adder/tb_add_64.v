`timescale 1ns/1ps
`include "add_64.v"
module tb_add_64();
wire[63:0] sum;
wire c_out;
reg [63:0] a;
reg [63:0] b;
reg c_in;
add_64 M1 ( .sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));

initial begin // Time Out
#100 $finish; // Stopwatch
end


initial begin
        $dumpfile("add_64_tb.vcd");
    $dumpvars(0, tb_add_64);
a<= 64'd4096;
b<= -64'd467;
c_in<=0;

end
endmodule