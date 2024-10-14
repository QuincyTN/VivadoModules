`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 03:19:42 PM
// Design Name: 
// Module Name: tb_FIFO_Buffer
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


module tb_FIFO_Buffer;
    parameter WL = 8, DEPTH = 8;
    reg CLK, RST, rReq, wReq;
    reg [WL-1:0] din;
    wire Full, Empty, Error;
    wire [WL-1:0] dout;
    
    FIFO_Buffer #(.WL(WL), .DEPTH(DEPTH)) Buffer1 (.CLK(CLK),
                                                   .RST(RST),
                                                   .rReq(rReq),
                                                   .wReq(wReq),
                                                   .din(din),
                                                   .Full(Full),
                                                   .Empty(Empty),
                                                   .Error(Error),
                                                   .dout(dout));
     
     always begin
        CLK = 0; #5;
        CLK = 1; #5;
     end
     
     initial begin
        RST = 0;
        rReq = 0;
        wReq = 0;
        din = 0;
        @(posedge CLK);
        @(posedge CLK);
        RST = 1;
    end
    
    initial begin
        @(RST);
        
        @(posedge CLK);
        wReq = 1;
        din = 1;
        
        @(posedge CLK);
        din = 2;
        
        @(posedge CLK);
        din = 4;
        
        @(posedge CLK);
        din = 5;
        
        @(posedge CLK);
        din = 7;
        
        @(posedge CLK);
        din = 4;
        
        @(posedge CLK);
        wReq = 0;
        rReq = 1;
        
        @(posedge CLK);
        wReq = 1; 
        rReq = 0;
        din = 3;
        
        @(posedge CLK);
        wReq = 1; 
        rReq = 0;
        din = 1; 
        
        repeat(6) begin @(posedge CLK); wReq = 0; rReq = 1; end 
        
        wReq = 1;
        rReq = 0;
        din = 2;
        
        @(posedge CLK);
        wReq = 0;      //change these values to check Full, Empty, Error conditions    
        rReq = 0;
        repeat(3) @(posedge CLK);
        $finish;
    end
endmodule
