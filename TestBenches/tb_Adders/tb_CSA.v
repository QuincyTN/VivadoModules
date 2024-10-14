`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 08:54:31 PM
// Design Name: 
// Module Name: tb_CSA
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


module tb_CSA;
    
    reg [15:0] a, b;
    reg c_in;
    wire [15:0] sum;
    wire c_out;
    
    CSA CSA1(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    initial begin
        a = 16'b0000000000000000;
        b = 16'b0000000000000000;
        c_in = 0;
        #5;
        a = 16'b1111111111111111;
        b = 16'b0000000000000001;
        c_in = 1;
        #5;
        a = 16'b1111111111111111;
        b = 16'b1111111111111111;
        c_in = 0;
        #5
    
    
    $finish;
    end

endmodule
