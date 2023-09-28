

module register_file(
output [63:0] read_data_1, read_data_2,
input [63:0] write_reg_data,
input [4:0] read_1_addr, read_2_addr, write_addr,
input regWrite_en, clk, rst
);

reg [63:0] regArray [31:0];

assign read_data_1 = regArray[read_1_addr];
assign read_data_2 = regArray[read_2_addr];

always@(posedge clk) begin
    if(regWrite_en)begin
        regArray[write_addr]=write_reg_data;
    end
    if(rst==1) begin
        for(integer i=0; i<32; i=i+1) begin
            regArray[i] <= 64'b0;
        end
    end

    regArray[0] = 64'b0;
end



endmodule