`timescale 1ns/1ps
`include "add_16.v"
module add_32(
    output [31:0] sum,
    output c_out,
    input [31:0] a,
    input [31:0] b,
    input c_in
);

wire c_in16;

add_16 a0 (sum[15:0], c_in16, a[15:0], b[15:0], c_in);
add_16 a1 (sum[31:16], c_out, a[31:16], b[31:16], c_in16);

endmodule