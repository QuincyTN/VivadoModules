`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 08:49:15 PM
// Design Name: 
// Module Name: Nbit_2to1_Mux
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


module Nbit_2to1_Mux #(parameter N = 1)
                      (input [N-1:0] a,b,
                       input sel,
                       output [N-1:0] out);
                       
    assign out = (sel) ? a : b;      
endmodule
