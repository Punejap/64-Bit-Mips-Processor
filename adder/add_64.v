
`include "add_32.v"
module add_64(
    output[63:0] sum,
    output c_out,
    input[63:0] a,
    input[63:0] b,
    input c_in
);

wire c_in32;

add_32 a0 (sum[31:0], c_in32, a[31:0], b[31:0], c_in);
add_32 a1 (sum[63:32], c_out, a[63:32], b[63:32], c_in32);

endmodule

