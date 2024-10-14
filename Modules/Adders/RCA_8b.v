`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 08:09:10 PM
// Design Name: 
// Module Name: RCA_8b
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


module RCA_8b(input [7:0] a, b, 
              input c_in, 
              output [7:0] sum, 
              output c_out);
              
    wire carry;
    
    //instantiation of 2 4-bit adders
    RCA_4b adder1 (.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(carry));
    RCA_4b adder2 (.a(a[7:4]), .b(b[7:4]), .c_in(carry), .sum(sum[7:4]), .c_out(c_out));
    
endmodule
