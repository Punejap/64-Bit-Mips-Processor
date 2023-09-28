`timescale  1ns / 1ps
`include "datamem.v"
module datamem_tb;   



// datamem Inputs
reg   [63:0]  address                      = 52 ;
reg   [127:0]  write_data                   = 163 ;
reg   memWrite_en                          = 1 ;
reg   memRead_en                           = 0 ;
reg enable = 1;

// datamem Outputs
wire  [63:0]  read_data                    =0;


datamem  u_datamem (
    .address                 ( address      [63:0] ),
    .write_data_word              ( write_data   [127:0] ),
    .memWrite_en             ( memWrite_en         ),
    .memRead_en              ( memRead_en          ),
    .read_data               ( read_data    [63:0] ),
    .en                      ( enable                   )
);

initial
begin
    $dumpfile("datamem.vcd");
    $dumpvars(0,datamem_tb);
end

initial begin
    #100 $finish;
end

endmodule