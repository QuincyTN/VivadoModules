`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 08:13:26 PM
// Design Name: 
// Module Name: tb_MUX_2to1
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


module tb_MUX_2to1;

    reg sel, in_1, in_2;
    wire mux_out;
    
    MUX_2to1 mux (.sel(sel), .in_1(in_1), .in_2(in_2), .mux_out(mux_out));
    
    initial begin
        sel = 1;
        in_1 = 1'b1;
        in_2 = 1'b0;
        #5;
        sel = 0;
        #5;      
    $finish;
    end
    
endmodule
