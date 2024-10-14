`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 05:50:04 PM
// Design Name: 
// Module Name: tb_Serial_RSR
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


module tb_Serial_RSR;

    reg data, CLK, RST;
    wire SO;
    
    Serial_RSR #(.BITS(4)) RSR1 (.data(data), .CLK(CLK), .RST(RST), .SO(SO));
    
    always begin
        CLK = 0;
        #5;
        CLK = 1;
        #5;
    end
    
    initial begin
        RST = 1;
        @(posedge CLK); RST = 0; data = 1;
        @(posedge CLK); @(posedge CLK); @(posedge CLK); @(posedge CLK);
        @(posedge CLK); @(posedge CLK); @(posedge CLK); @(posedge CLK);
        @(posedge CLK); data = 0;
        @(posedge CLK); @(posedge CLK); @(posedge CLK); @(posedge CLK);
        @(posedge CLK); @(posedge CLK); @(posedge CLK); @(posedge CLK);
        @(posedge CLK); RST = 1;
        #5; $finish;
    end
endmodule
