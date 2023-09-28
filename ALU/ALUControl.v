//add mult,div

module ALUControl(
    output reg [3:0] OpCode,
    input[1:0] ALUOp,
    input[2:0] funct3,
    input funct7
);

always @(ALUOp) begin
    if(ALUOp == 'b10)begin
        if( (funct7) && (funct3 == 'b000) )begin
            OpCode = 'b0110;                        //sub
        end
        case(funct3)
            3'b000   : OpCode = 4'b0010;              //add
            3'b100   : OpCode = 4'b1000;               //mul
            3'b001   : OpCode = 4'b0011;               //div
            3'b111   : OpCode = 4'b0000;              //and
            3'b110   : OpCode = 4'b0001;              //or
        endcase
    end else if(ALUOp == 2'b00)begin
        OpCode = 3'b0010;                              //lw, sw
    end else if(ALUOp == 'b01)begin
        OpCode = 3'b0110;                            //beq
    end

end

endmodule




