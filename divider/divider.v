`timescale 1ns/1ps

module divider (
output reg[63:0] quotient,
output reg [63:0] remainder_out,
output ready,
input [63:0] a, b
);

reg [127:0] remainder, divisor;
reg [7:0] ctr;
reg clk;
wire ready;
wire nega, negb;

assign ready = (ctr >= 65) ? 1:0;
assign nega = a[63];
assign negb = b[63];

always begin
  #2 clk = ~clk;
end

always@(a|b)begin
    quotient <= 0;
    ctr <=0;
    remainder = (nega) ? {64'b0, -a} : {64'b0,a};
    divisor = (negb) ? (-b << 64) : (b<<64);
    clk=0;
end

always@(clk)
begin

if(ctr < 65)begin
    remainder = remainder - divisor;
    quotient = quotient <<1;
    if(remainder[127]==1)begin
        remainder = remainder + divisor;
        quotient[0] <= 0;
    end else begin
        quotient[0] <=1;
    end
    divisor = divisor >> 1;
    ctr=ctr+1;
end
if(ctr >= 65) begin
    if(nega !== negb) begin
      quotient[63] <= 1;
    end
    remainder_out[63:0] <= remainder[63:0];
end
end

endmodule