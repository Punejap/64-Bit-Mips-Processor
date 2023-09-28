`timescale  1ns/1ps
`include "immgen.v"

module immgen_tb;

reg [31:0]instrt;
wire [63:0] outb;
immgen m1 (outb, instrt);

initial begin 
$dumpfile("immgentb.vcd");
$dumpvars(0, immgen_tb);

#10 instrt <= {12'b110110110101,7'b0000011};
#20 instrt[31:0] <= 32'b10101010101010101011110111100111;
#10 instrt[31:0] <= 32'b10101010101010101011110110101010;
#100 $finish;

end

endmodule