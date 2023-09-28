module immgen(
    output reg [63:0]outrg,
    input[31:0] instr
);

wire[6:0] opcode;
assign opcode = instr[6:0];
always@(instr)begin 
    casex(opcode) 
    7'b0000011  :   outrg[63:0] <= { {53{instr[31]}}, instr[30:20] };//lw
    7'b0100011  :   outrg[63:0] <= { {53{instr[31]}}, instr[30:25], instr[11:7] }; //sw
    7'b1100111  :   outrg[63:0] <= { {53{instr[31]}}, instr[7], instr[30:25], instr[11:9]}; //brnch
    default :   outrg <= 64'bx;
    endcase
end

endmodule

