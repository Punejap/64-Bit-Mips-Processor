`timescale 1ns/1ps
`include "add_4.v"
module add_16(
    output [15:0] sum,
    output c_out,
    input [15:0] a,
    input [15:0] b,
    input c_in
);

wire c_in4, c_in8, c_in12;

add_4 a0 (sum[3:0], c_in4, a[3:0], b[3:0], c_in);
add_4 a1 (sum[7:4], c_in8, a[7:4], b[7:4], c_in4);
add_4 a2 (sum[11:8], c_in12, a[11:8], b[11:8], c_in8);
add_4 a3 (sum[15:12], c_out, a[15:12], b[15:12], c_in12);
endmodule
