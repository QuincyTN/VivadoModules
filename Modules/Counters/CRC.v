`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 11:45:01 AM
// Design Name: 
// Module Name: CRC
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


module CRC #(parameter RESIDUE = 8'hAC)
            (input [7:0] din,
             input D_VALID, CLK, RST,
             output [4:0] ctr,
             output D_READY);
    
    wire din_s, D_READY, CRC_VALID;
    
    //8 bit PISO Left Shift Register
    Parallel_LSR LSR1(.din(din), .CLK(CLK), .RST(RST), .D_VALID(D_VALID), .din_s(din_s), .D_READY(D_READY));
    
    //CRC8 with input from shift register
    CRC8 #(.RESIDUE(RESIDUE)) CRC8(.din_s(din_s), .CLK(CLK), .RST(RST), .CRC_VALID(CRC_VALID));
    
    //5 bit counter with CRC_VALID as input
    Counter #(.WIDTH(5)) ctr1(.EN(CRC_VALID), .CLK(CLK), .RST(RST), .ctr(ctr));
endmodule
