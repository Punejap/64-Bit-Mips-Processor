`timescale 1ns/1ps
`include "full_add.v"
module add_4(
output[3:0] sum,
output c_out,
input[3:0] a,
input[3:0] b,
input c_in
);

wire c_in2, c_in3, c_in4;

full_add fa0 (sum[0], c_in2, a[0], b[0], c_in);
full_add fa1 (sum[1], c_in3, a[1], b[1], c_in2);
full_add fa2 (sum[2], c_in4, a[2], b[2], c_in3);
full_add fa3 (sum[3], c_out, a[3], b[3], c_in4);

endmodule