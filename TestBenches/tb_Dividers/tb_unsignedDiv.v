`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2023 06:20:44 PM
// Design Name: 
// Module Name: tb_unsignedDiv
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


module tb_unsignedDiv;
    parameter N = 5;
    reg valid, CLK, RST;
    reg [N-1:0] divisor, dividend;
    wire ready;
    wire[N-1:0] quotient, remainder;
    
    unsignedDiv #(.N(N)) DUT (.valid(valid),
                              .CLK(CLK),
                              .RST(RST),
                              .divisor(divisor),
                              .dividend(dividend),
                              .ready(ready),
                              .quotient(quotient),
                              .remainder(remainder));
    
    always begin
        CLK = 0; #5;
        CLK = 1; #5;
    end
    
    initial begin
        RST = 1;
        @(posedge CLK); RST = 0;
        valid = 1; dividend = 5'd14; divisor = 5'd3;
        @(posedge CLK);
        repeat (N+5) begin @(posedge CLK); valid = 0;end
        valid = 1; dividend = 5'd17; divisor = 5'd2;
        repeat (N+5) begin @(posedge CLK); valid = 0;end
        
        $finish;
    end
    
    
endmodule
