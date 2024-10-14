`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 06:34:51 PM
// Design Name: 
// Module Name: RCA_4b
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


module RCA_4b(input [3:0] a, b, 
              input c_in, 
              output [3:0] sum, 
              output c_out);

    wire [2:0] carry;
    
    //instantiation of 4 full adders
    Gate_FA FA0(.a(a[0]), .b(b[0]), .c_in(c_in), .sum(sum[0]), .c_out(carry[0]));
    Gate_FA FA1(.a(a[1]), .b(b[1]), .c_in(carry[0]), .sum(sum[1]), .c_out(carry[1]));
    Dataflow_FA FA2(.a(a[2]), .b(b[2]), .c_in(carry[1]), .sum(sum[2]), .c_out(carry[2]));
    Dataflow_FA FA3(.a(a[3]), .b(b[3]), .c_in(carry[2]), .sum(sum[3]), .c_out(c_out));
endmodule
