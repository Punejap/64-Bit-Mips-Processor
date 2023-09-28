module control(
    output[1:0] ALUOp,
    output branch, memWrite, memRead, regWrite, memToReg,  ALUsrc, 
    input [6:0] instr,
    input clk
);

// wire branch, memRead, memToReg, memWrite, ALUsrc, regWrite;
//wire [1:0] ALUctrl;

    reg[7:0] decoder;
    assign ALUOp = decoder[1:0];
    assign branch = decoder[2];
    assign memWrite = decoder[3];
    assign memRead = decoder[4];
    assign regWrite = decoder[5];
    assign memToReg = decoder[6];
    assign ALUsrc = decoder[7];

always@(posedge clk) begin
    case(instr)
    7'h33   :   decoder <= 8'b00100010;  //r_type
    7'h3    :   decoder <= 8'b11110000;  //beq
    7'h47   :   decoder <= 8'b10001000;  //sw
    7'h5    :   decoder <= 8'b00000101;    //lw
    endcase
end

endmodule