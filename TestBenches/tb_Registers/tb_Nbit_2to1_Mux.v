`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 08:51:19 PM
// Design Name: 
// Module Name: tb_Nbit_2to1_Mux
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


module tb_Nbit_2to1_Mux;
    parameter N = 4;
    reg [N-1:0] a,b;
    reg sel;
    wire [N-1:0] out;
    
    Nbit_2to1_Mux #(.N(N)) MUX1 (.a(a), .b(b), .sel(sel), .out(out));
    
    initial begin
        a = 4'b1100;
        b = 4'b0011;
        sel = 1;
        #5;
        sel = 0;
        #5;
        $finish;       
    end
endmodule
