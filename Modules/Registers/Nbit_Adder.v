`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 03:56:33 PM
// Design Name: 
// Module Name: Nbit_Adder
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


module Nbit_Adder #(parameter N = 4)
                   (input [N-1:0] a,b,
                    input c_in,
                    output [N-1:0] sum,
                    output c_out);
    
    assign {c_out, sum} = a + b + c_in;

endmodule
