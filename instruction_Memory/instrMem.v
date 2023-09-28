
module instrMem(
    output reg [31:0] instruction,
    input [63:0] address
);


always @(*) begin
    case(address)
    'd40    :   instruction <= 32'b00000110010000000010000010000011;
    'd44    :   instruction <= 32'b00000110011000000010000100000011;
    'd48    :   instruction <= 32'b00000110100000000010000110000011;
    'd52    :   instruction <= 32'b00000110101000000010001000000011;
    'd56    :   instruction <= 32'b00000110110000000010001010000011;
    'd60    :   instruction <= 32'b00000110111000000010001100000011;
    'd64    :   instruction <= 32'b00000000010100001000000010110011;
    'd68    :   instruction <= 32'b01000000001100010000000100110011;
    'd72    :   instruction <= 32'b00000000010100010100100000110011;
    'd76    :   instruction <= 32'b00000000001000001000010110110011;
    'd80    :   instruction <= 32'b00000000011001011001111000110011;
    'd84    :   instruction <= 32'b00000001100100000010000010100011;
    default : instruction <= 32'bx;
    endcase
end
endmodule
    