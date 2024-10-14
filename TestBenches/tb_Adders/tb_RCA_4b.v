`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 06:47:13 PM
// Design Name: 
// Module Name: tb_RCA_4b
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


module tb_RCA_4b;

    reg [3:0] a,b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;
    
    RCA_4b RCA1 (.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    initial begin
        a = 4'b0000;
        b = 4'b0000;
        c_in = 1'b0;
        #5;
        a = 4'b1010;
        b = 4'b0101;
        c_in = 1'b0;
        #5;
        a = 4'b1111;
        b = 4'b1111;
        c_in = 1'b1;
        #5;
    
    
    $finish;
    end
    
endmodule
