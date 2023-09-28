`timescale 1ns / 1ps
`include "half_add.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 03:53:04 AM
// Design Name: 
// Module Name: full_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_add(
    output sum,
    output c_out,
    input a,
    input b,
    input c_in
    );
    wire w1,w2,w3;
    half_add m1(w1,w2,a,b);
    half_add m2(sum,w3,c_in,w1);
    or(c_out,w2,w3);

endmodule
