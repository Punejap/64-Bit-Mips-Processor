`include "adder.v"
`include "multiplier.v"
`include "divider.v"
`include "subtractor.v"
`timescale 1ns/1ps
module ALU(
    output reg [127:0] result,
    output reg zero, 
    output c_out,
    input [63:0]read_data_1, reg_mux,
    input [3:0] opcode,
    input reset
);

wire [63:0]add;
wire [63:0]sub;
wire [127:0]mul;
wire [127:0]div;

always @(opcode | reset) begin
    zero = (read_data_1 == reg_mux) ?  1 : 0; 
    case(opcode)
    4'b0010 :   result[63:0] <= add;
    4'b0110 :   result <= sub;
    4'b1000 :   result <= mul;
    4'b0011 :   result <= div;
    4'b0000 :   result <= (read_data_1 & reg_mux);
    4'b0001 :   result <= (read_data_1 | reg_mux);
    endcase
end



addercat a1( add[63:0],c_out, read_data_1[63:0], reg_mux[63:0], a_c_in);
subtractor s1( sub[63:0], s_c_out, read_data_1[63:0], reg_mux[63:0], s_c_in );
multiplier m1(mul[127:0], read_data_1[63:0], reg_mux[63:0]);
divider d1(div[63:0], div[127:64], d_ready, read_data_1[63:0], reg_mux[63:0]);

endmodule
