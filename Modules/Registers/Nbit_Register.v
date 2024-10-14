`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 11:26:13 AM
// Design Name: 
// Module Name: Nbit_Register
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


module Nbit_Register #(parameter N = 4)
                      (input [N-1:0] d,
                       input CLK, RST,
                       output reg [N-1:0] q);
    always @(posedge CLK or posedge RST) begin                       
        if(RST) q <= 0;
        else q <= d;
    end
endmodule
