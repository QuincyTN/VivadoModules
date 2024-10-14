`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 10:56:19 AM
// Design Name: 
// Module Name: tb_CRC8
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


module tb_CRC8;
    parameter RESIDUE = 8'hAC;
    reg din_s, CLK, RST;
    wire CRC_VALID;
    wire [7:0] CRC_OUT;
   
    CRC8 #(.RESIDUE(RESIDUE)) DUT (.din_s(din_s), .CLK(CLK), .RST(RST), .CRC_VALID(CRC_VALID), .CRC_OUT(CRC_OUT));
    
    always begin
        CLK = 0; #5;
        CLK = 1; #5;
    end
    
    initial begin
        RST = 1; 
        @(posedge CLK); RST = 0; 
        repeat(4) begin
            din_s = 1; @(posedge CLK);
            din_s = 0; @(posedge CLK);
        end

        $finish;
    end
    
endmodule
