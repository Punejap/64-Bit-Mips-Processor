
module half_add(
    output sum,
    output c_out,
    input a,
    input b
    );

    xor (sum,a,b);
    and (c_out,a,b);

endmodule
