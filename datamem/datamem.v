module datamem(
    output reg[63:0] read_data,
    input [63:0] address,
    input [127:0] write_data_word,
    input memWrite_en, memRead_en, en
);


reg[63:0] write_data_1, write_data_2;
reg [63:0] data [255:0];

always@(posedge en) begin
    write_data_1 = write_data_word[63:0];
    write_data_2 = write_data_word[127:64];
    if(memRead_en==1)begin
        read_data = data[address];
    end 
    if(memWrite_en) begin
        data[address] = write_data_1;
        data[(address+1)] = write_data_2;
    end
end
endmodule