`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 08:17:00 PM
// Design Name: 
// Module Name: tb_RCA_8b
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


module tb_RCA_8b;

    reg [7:0] a,b;
    reg c_in;
    wire [7:0] sum;
    wire c_out;
    
    RCA_8b RCA1 (.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    initial begin
        a = 8'b00000000;
        b = 8'b00000000;
        c_in = 1'b0;
        #5;
        a = 8'b10101010;
        b = 8'b01010101;
        c_in = 1'b0;
        #5;
        a = 8'b11111111;
        b = 8'b11111111;
        c_in = 1'b1;
        #5;
    
    
    $finish;
    end
    
endmodule
