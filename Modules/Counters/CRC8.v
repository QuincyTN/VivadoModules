`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 10:36:10 AM
// Design Name: 
// Module Name: CRC8
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


module CRC8 #(parameter RESIDUE = 8'hAC)
             (input din_s, CLK, RST,
              output CRC_VALID,
              output [7:0] CRC_OUT);
              
    reg [7:0] tmpCRC;
    always @(posedge CLK or posedge RST) begin
        if(RST) tmpCRC <= 0;
        else begin
            tmpCRC[0] <= tmpCRC[7] ^ din_s;
            tmpCRC[1] <= tmpCRC[0];
            tmpCRC[2] <= tmpCRC[1];
            tmpCRC[3] <= tmpCRC[2];
            tmpCRC[4] <= tmpCRC[3] ^ tmpCRC[7] ^ din_s;
            tmpCRC[5] <= tmpCRC[4] ^ tmpCRC[7] ^ din_s;
            tmpCRC[6] <= tmpCRC[5];
            tmpCRC[7] <= tmpCRC[6];
        end
    end            
    assign CRC_OUT = tmpCRC;
    assign CRC_VALID = (tmpCRC == RESIDUE) ? 1 : 0;
endmodule
