`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 11:34:15 AM
// Design Name: 
// Module Name: tb_BSA
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


module tb_BSA;
    parameter WL = 4;
    reg [WL-1:0] a,b;
    reg CLK, RST, Load;
    wire sbit;

    BSA #(.WL(WL)) BSA1 (.a(a), .b(b), .CLK(CLK), .RST(RST), .Load(Load), .sbit(sbit));
    
    always begin
        CLK = 0;
        #5;
        CLK = 1;
        #5;
    end
    
    initial begin
        RST = 1; @(posedge CLK); RST = 0; Load = 1;
        a = 4'b1111;
        b = 4'b1111;
        @(posedge CLK); Load = 0;
        @(posedge CLK);@(posedge CLK);@(posedge CLK);@(posedge CLK);
        @(posedge CLK);
        $finish;
    end
    
endmodule
