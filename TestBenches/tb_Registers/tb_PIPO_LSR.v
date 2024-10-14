`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 04:44:00 PM
// Design Name: 
// Module Name: tb_PIPO_LSR
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


module tb_PIPO_LSR;
    parameter BITS = 4;
    reg [BITS-1:0] data;
    reg CLK, RST, Load, In;
    wire [BITS-1:0] out;
    
    PIPO_LSR #(.BITS(BITS)) LSR1 (.data(data), .CLK(CLK), .RST(RST), .Load(Load), .In(In), .out(out));
    
    always begin
        CLK = 0; #5;
        CLK = 1; #5;
    end
    
    initial begin
        RST = 1; Load = 0; In = 0; data = 'b1001;
        @(posedge CLK); RST = 0; Load = 1;
        @(posedge CLK); Load = 0;
        @(posedge CLK);@(posedge CLK);@(posedge CLK);@(posedge CLK);
        $finish;
    end
    
endmodule
