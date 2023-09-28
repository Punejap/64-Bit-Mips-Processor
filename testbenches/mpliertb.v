`timescale 1ns/1ps
`include "multiplier.v"

module mpliertb();

wire [127:0] product;
wire rdy;
reg [63:0] a,b;





multiplier M1 (product, rdy, a, b);



initial begin

    $dumpfile("mpliertb.vcd");
    $dumpvars(0, mpliertb);
a = 659;
b = -42;

#128 ;

a=400;
b=-5;
#128 $finish;

end

endmodule