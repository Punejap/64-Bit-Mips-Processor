
`include "divider.v"
`timescale  1ns / 1ps

module tb_divider;   

// divider Parameters
parameter PERIOD  = 10;


// divider Inputs
reg   [63:0]  a                            = 0 ;
reg   [63:0]  b                            = 0 ;

// divider Outputs
wire  [63:0]  quotient                     ;
wire  [63:0]  remainder_out                ;
wire  ready                                ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

divider  u_divider (
    .a                       ( a              [63:0] ),
    .b                       ( b              [63:0] ),

    .quotient                ( quotient       [63:0] ),
    .remainder_out           ( remainder_out  [63:0] ),
    .ready                   ( ready                 )
);

initial
begin

    $finish;
end

endmodule