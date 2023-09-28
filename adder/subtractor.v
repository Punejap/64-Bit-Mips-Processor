module subtractor (
output [63:0] difference,
output c_out,
input [63:0] a,b,
input c_in
);

reg 2c;

b = (b ^ 0xffffffffffffffff);



endmodule