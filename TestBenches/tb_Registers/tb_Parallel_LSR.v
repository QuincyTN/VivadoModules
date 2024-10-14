`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 10:33:44 AM
// Design Name: 
// Module Name: tb_Parallel_LSR
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


module tb_Parallel_LSR;

    parameter BITS = 8;
    reg [BITS-1:0] data;
    reg CLK, RST, Load, In;
    wire out;
    
    Parallel_LSR #(.BITS(BITS)) LSR1 (.data(data), 
                                      .CLK(CLK), 
                                      .RST(RST), 
                                      .Load(Load), 
                                      .In(In), 
                                      .out(out));
     
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
        @(posedge CLK);
        #5; $finish;
    end
endmodule
