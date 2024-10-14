`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 07:51:27 PM
// Design Name: 
// Module Name: Dataflow_FA
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


module Dataflow_FA(input a, b, c_in, 
                   output sum, c_out);

    wire x,y,z;
    
    //Logic for output sum
    assign x = a ^ b;
    assign sum = x ^ c_in;
    
    //logic for output c_out
    assign y = a & b;
    assign z = c_in & x;
    assign c_out = y | z;
    
endmodule
