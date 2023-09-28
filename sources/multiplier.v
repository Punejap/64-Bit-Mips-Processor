`timescale 1ns/1ps
module multiplier(
output [127:0] product,
input wire[63:0] a, b
);

reg [127:0] product, mc;
reg [63:0] mp;
reg [6:0] ctr;
reg clk;

wire nega, negb;

assign nega = a[63];
assign negb = b[63];
assign ready = (ctr>=63) ? 1:0;

always begin
  #2 clk = ~clk;
end

always@(a|b) begin
    product <= 0;
    mp <= (nega) ? -a : a;
    mc <= (negb) ? -b : b;
    mc[127:64] <=64'b0;
    clk <= 0;
    ctr = 0;
  end

always@(clk)
begin 
if(ctr<63)begin
  if(mp[0]==1)begin
    product <= product+ mc;
    end
  mc = mc << 1;
  mp = mp >>1;
  ctr =ctr+1;
end
if(ctr>=63)begin
      if(a[63] !== b[63]) begin
      product[127] <= 1;
    end
end
end


endmodule