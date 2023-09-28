`include "addercat.v"

module subtractor (
output [63:0] difference,
output s_c_out,
input [63:0] a_sub,
input [63:0] b_sub,
input s_c_in
);
reg [63:0] b_neg;
always@(a_sub | b_sub) begin
    b_neg = - b_sub;
end


addercat m1(.sum(difference[63:0]), .c_out(s_c_out), .a(a_sub[63:0]), .b(b_neg[63:0]), .c_in(s_c_in));

endmodule