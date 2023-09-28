

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
    if(posedge rst) begin
        for(integer ii=0; ii<32; ii=ii+1) begin
            regArray[ii] <= 64'b0;
        end
    end

    regArray[0] = 64'b0;
end



endmodule