`include "addercat.v"
`include "two_one_mux.v"

module pc_adder(
output[63:0] address,
input[63:0] imm_gen, 
input mux_en, clk, rst
);

reg zero = 0;
reg[63:0] imm_gen_sh;
reg[63:0] pc;
wire[63:0] mux_out, s0, s1;
wire[63:0] four;
assign four = 4'b100;
assign address = pc;

initial pc = 40;

always@(imm_gen)begin
    imm_gen_sh = imm_gen << 1;
end

always@(posedge clk)begin
    pc = mux_out;
end

two_one_mux mux(.data_out(mux_out), .in_0(s0), .in_1(s1), .en(mux_en));

addercat ad0(.sum(s0), .c_out(c_out0), .a(pc), .b(four), .c_in(zero));
addercat ad1(.sum(s1), .c_out(c_out1), .a(pc), .b(imm_gen_sh), .c_in(zero));

endmodule