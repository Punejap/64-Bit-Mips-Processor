`timescale  1ns / 1ps   
`include "subtractor.v"
module subtractor_tb;   

// subtractor Parameters
parameter PERIOD  = 10; 


// subtractor Inputs
reg   [63:0]  a_sub                        = 0 ;
reg   [63:0]  b_sub                        = 0 ;
reg   c_in                                 = 0 ;

// subtractor Outputs
wire  [63:0]  difference                   ;
wire  s_c_out                              ;

subtractor  u_subtractor (
    .a_sub                   ( a_sub       [63:0] ),
    .b_sub                   ( b_sub       [63:0] ),
    .s_c_in                    ( c_in               ),

    .difference              ( difference  [63:0] ),
    .s_c_out                 ( s_c_out            )
);

initial
begin
    $dumpfile("subber.vcd");
    $dumpvars(0, subtractor_tb);

    #5 a_sub = 13123124;
    #5 b_sub =999922;
    #5 c_in = 0;
    #50
    #5 a_sub = 63;
    #5 b_sub =21;
    #5 c_in = 0;
    #50
    #5 a_sub = 30;
    #5 b_sub =90;
    #5 c_in = 0;
    #50
    $finish;
end

endmodule