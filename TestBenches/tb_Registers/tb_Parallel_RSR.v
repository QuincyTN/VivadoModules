`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 08:14:23 PM
// Design Name: 
// Module Name: tb_Parallel_RSR
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


module tb_Parallel_RSR;
    parameter BITS = 8;
    reg [BITS-1:0] data;
    reg CLK, RST, Load, In;
    wire SO;
    
    Parallel_RSR #(.BITS(BITS)) RSR1 (.data(data), 
                                      .CLK(CLK), 
                                      .RST(RST), 
                                      .Load(Load), 
                                      .In(In), 
                                      .SO(SO));
     
    always begin
        CLK = 0;
        #5;
        CLK = 1;
        #5;
    end
    
    initial begin
        RST = 1; In = 1;
        @(posedge CLK); RST = 0; data = 8'b1010; Load = 1;
        @(posedge CLK); Load = 0;
        @(posedge CLK); @(posedge CLK); @(posedge CLK); @(posedge CLK);
        @(posedge CLK); In = 0;
        @(posedge CLK); @(posedge CLK); @(posedge CLK); @(posedge CLK);
        @(posedge CLK); RST = 1;
        #5; $finish;
    end
endmodule
