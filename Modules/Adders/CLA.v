`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 01:34:21 PM
// Design Name: 
// Module Name: CLA
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


module CLA(input [3:0] a,b, 
           input c_in, 
           output [3:0] sum, 
           output c_out);
           
    wire g1, g2, g3, g4, p1, p2, p3, p4;
    wire c1, c2, c3, c4;
    
    //Carry lookahead dataflow logic
    //First carry
    assign g1 = a[0] & b[0];
    assign p1 = a[0] ^ b[0];
    assign c1 =  g1 | (c_in & p1);
    
    //Second carry
    assign g2 = a[1] & b[1];
    assign p2 = a[1] ^ b[1];
    assign c2 =  g2 | (g1 & p2) | (c_in & p1 & p2);
    
    //Third carry
    assign g3 = a[2] & b[2];
    assign p3 = a[2] ^ b[2];
    assign c3 =  g3 | (g2 & p3) | (g1 & p2 & p3) | (c_in & p1 & p2 & p3);
    
    //Fourth carry
    assign g4 = a[3] & b[3];
    assign p4 = a[3] ^ b[3];
    assign c4 =  g4 | (g3 & p4) | (g2 & p3 & p4) | (g1 & p2 & p3 & p4) | (c_in & p1 & p2 & p3 & p4);
    
    //Adders using carry lookahead
    Dataflow_FA adder1(.a(a[0]), .b(b[0]), .c_in(c_in), .sum(sum[0])),
                adder2(.a(a[1]), .b(b[1]), .c_in(c1), .sum(sum[1])),
                adder3(.a(a[2]), .b(b[2]), .c_in(c2), .sum(sum[2])),
                adder4(.a(a[3]), .b(b[3]), .c_in(c3), .sum(sum[3]));
                
     //Fourth carry to c_out
     assign c_out = c4;
    
    
endmodule
