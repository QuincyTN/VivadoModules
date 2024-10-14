`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 02:52:10 PM
// Design Name: 
// Module Name: FIFO_Buffer
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


module FIFO_Buffer #(parameter WL = 8, DEPTH = 8)
                    (input CLK, RST, rReq, wReq,
                     input [WL-1:0] din,
                     output Full, Empty, Error,
                     output reg [WL-1:0] dout);

    reg [WL-1:0] buffer [DEPTH-1:0];
    
    integer rPtr, wPtr, i, height;
    
    always @(posedge CLK) begin
        if(!RST) begin
            rPtr <= 0;
            wPtr <= 0;
            dout <= 0;
            height <= 0;
            for(i = 0; i < DEPTH; i = i + 1) begin
                buffer[i] <= 0;
            end
        end
        else begin
            if(rReq) begin
                if(!Empty) begin
                    dout <= buffer[rPtr];
                    rPtr <= (rPtr + 1) % DEPTH;
                    height <= height - 1;
                end
                else if(!Empty && wReq) begin
                    dout <= buffer[rPtr];
                    rPtr <= rPtr;
                    wPtr <= wPtr;
                    height <= height;
                end
            end
            if(wReq) begin
                if(!Full) begin
                    buffer[wPtr] <= din;
                    wPtr <= (wPtr + 1) % DEPTH;
                    height <= height + 1;
                end
                else if(!Full && rReq) begin
                    buffer[wPtr] <= din;
                    rPtr <= rPtr;
                    wPtr <= wPtr;
                    height <= height;
                end
            end
        end       
    end
    
    assign Full = (rPtr == wPtr && height >= DEPTH) ? 1 : 0;
    assign Empty = (rPtr == wPtr && height <= 0) ? 1 : 0;
    assign Error = ((Full && wReq) || (Empty && rReq)) ? 1 : 0;
endmodule
