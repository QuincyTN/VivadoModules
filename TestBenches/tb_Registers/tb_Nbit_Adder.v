`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 04:11:57 PM
// Design Name: 
// Module Name: tb_Nbit_Adder
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


module tb_Nbit_Adder;
    parameter N = 4;
    reg [N-1:0] a,b;
    reg c_in;
    wire [N-1:0] sum;
    wire c_out;
    
    Nbit_Adder #(.N(N)) ADD0 (.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));
    
    initial begin
        a = 4'b1010;
        b = 4'b0101;
        c_in = 0;
        #5;
        a = 4'b1111;
        b = 4'b1111;
        #5;
        c_in = 1;
        a = 4'b1011;
        b = 4'b0011;
        #5;
        $finish;
    end

endmodule
