`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 11:54:14 AM
// Design Name: 
// Module Name: tb_CRC
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


module tb_CRC;
    parameter RESIDUE = 8'hAC;
    reg CLK, RST, D_VALID;
    reg [7:0] din;
    wire [4:0] ctr;
    wire D_READY;
    
    parameter TV_SIZE = 448;
    reg [TV_SIZE-1:0] test_vector;
    
    CRC #(.RESIDUE(RESIDUE)) DUT (.din(din),
                                  .CLK(CLK),
                                  .RST(RST), 
                                  .D_VALID(D_VALID),
                                  .ctr(ctr),
                                  .D_READY(D_READY));
    always begin
        CLK = 0; #5;
        CLK = 1; #5;
    end
    
    integer i;
    initial begin
        test_vector = 448'h7B19FA42CE00EEF2419B008FDAC620AF9700ABE9000F3EF765325B00320000AE00F900A1D37C2B4F270000A55F2700F900A1D37C2B4F2700;
        
        RST = 1; D_VALID = 1;
        @(posedge CLK); RST = 0;
        for(i = TV_SIZE-1; i > 0; i = i - 8) begin
            D_VALID = 1;
            din = test_vector[i-: 8];
            repeat (8) begin
                @(posedge CLK);
                D_VALID = 0;
            end
        end
        $finish;
    end
    
endmodule
