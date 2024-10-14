`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 01:59:17 PM
// Design Name: 
// Module Name: tb_CLA
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


module tb_CLA;
    reg [3:0] a,b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;
        
    CLA CLA1(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    initial begin
        a = 4'b0000;
        b = 4'b0000;
        c_in = 0;
        #5;
        a = 4'b1111;
        b = 4'b0000;
        c_in = 1;
        #5;
        a = 4'b1010;
        b = 4'b0101;
        c_in = 0;
        #5;
        a = 4'b1111;
        b = 4'b1111;
        c_in = 1;
        #5;
    $finish;
    end
    
endmodule
