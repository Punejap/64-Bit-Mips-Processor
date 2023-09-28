`timescale 1ns/1ps

module divider (
output [63:0] quotient,
output [127:0] remainder,
output ready,
input [127:0] a, b,
input reset, clk
);

reg [63:0] quotient;
reg [127:0] remainder, divisor, dividend;
reg [7:0] ctr;
reg ready;

always@(posedge clk)
begin
  if(reset)begin
    quotient <= 0;
    ctr <=0;
    ready<=0;
    remainder [127:0] <= a[127:0];
    divisor = b << 64;
  end

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
if(ctr>=65) begin
    ready<=1;
end
end

endmodule