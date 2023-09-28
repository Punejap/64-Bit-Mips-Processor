
module sign_extender(
    output reg[127:0] out,
    input[63:0] in
);

always@(in)begin
    out <= { {127{in[63]}}, in};
end

endmodule