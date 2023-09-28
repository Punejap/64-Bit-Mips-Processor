`timescale 1ns/1ps

module divider (
output [63:0] quotient,
output [63:0] remainder_out,
output ready,
input [63:0] a, b
);

reg[63:0] quotient, remainder_out;
reg [127:0] remainder, divisor;
reg [7:0] ctr;
wire [63:0] a,b;
reg clk;
wire ready;

assign ready = (ctr >= 65) ? 1:0;

always begin
  #2 clk = ~clk;
end

always@(a or b)begin
    quotient = 0;
    ctr[7:0] =8'b0;
    remainder = (a[63]) ? {64'b0, -a} : {64'b0,a};
    divisor = (b[63]) ? {-b, 64'b0} : {b,64'b0};
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
    if(a[63] !== b[63]) begin
      quotient[63] <= 1;
    end
    remainder_out[63:0] <= remainder[63:0];
end
end

endmodule