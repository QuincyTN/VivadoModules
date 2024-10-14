`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 02:49:07 PM
// Design Name: 
// Module Name: tb_SASM
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


module tb_SASM;
    parameter WL = 4;
    reg [2*WL-1:0] a;
    reg [WL-1:0] b;
    reg CLK, RST, Load;

    SASM #(.WL(WL)) SASM1 (.a(a), .b(b), .CLK(CLK), .RST(RST), .Load(Load));
    
    always begin
        CLK = 0;
        #5;
        CLK = 1;
        #5;
    end
    
    generate integer i;
    initial begin
        RST = 1; a = 4'b0101; b = 4'b1011;
        @(posedge CLK); RST = 0; Load = 1;
        @(posedge CLK); Load = 0;
        for(i = 0; i < WL-1; i = i+1) begin
            @(posedge CLK);
        end
        #5;
        $finish;
    end

    endgenerate 
endmodule
