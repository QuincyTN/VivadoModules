`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 11:32:12 AM
// Design Name: 
// Module Name: tb_Nbit_Register
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


module tb_Nbit_Register;
    parameter N = 4;
    reg [N-1:0] d;
    reg CLK, RST;
    wire [N-1:0] q;
    
    Nbit_Register #(.N(N)) R0 (.d(d), .CLK(CLK), .RST(RST), .q(q));
    
    //CLK period of 10 ns
    always begin
        CLK = 0;
        #5;
        CLK = 1;
        #5;
    end
    
    initial begin
        RST = 1; d = 4'b0000;
        @(posedge CLK); RST = 0;
        @(posedge CLK); d = 4'b1011;
        @(posedge CLK); d = 4'b0110;
        @(posedge CLK); d = 4'b1111;
        @(posedge CLK); d = 4'b0001;
        @(posedge CLK); RST = 1;
        #5;
        $finish;
    end
    
endmodule
