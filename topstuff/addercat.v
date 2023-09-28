module addercat(
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

module full_add(
    output sum,
    output c_out,
    input a,
    input b,
    input c_in
    );
    wire w1,w2,w3;
    half_add m1(w1,w2,a,b);
    half_add m2(sum,w3,c_in,w1);
    or(c_out,w2,w3);

endmodule

module half_add(
    output sum,
    output c_out,
    input a,
    input b
    );

    xor (sum,a,b);
    and (c_out,a,b);

endmodule
