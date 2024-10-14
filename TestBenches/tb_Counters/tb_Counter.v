`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 02:11:02 PM
// Design Name: 
// Module Name: tb_Counter
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


module tb_Counter;
    parameter WIDTH = 8;
    reg EN, CLK, RST;
    wire [WIDTH-1:0] ctr;
    
    Counter #(.WIDTH(WIDTH)) counter1 (.EN(EN),
                                       .CLK(CLK),
                                       .RST(RST),
                                       .ctr(ctr));
    always begin
        CLK = 0; #5;
        CLK = 1; #5;
    end
    
    initial begin
        RST = 1; EN = 0;
        @(posedge CLK); RST = 0; 
        repeat (8) begin
            EN = 1; @(posedge CLK);
            EN = 0; @(posedge CLK);
        end
        $finish;
    end
    
endmodule
