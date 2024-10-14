`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 04:52:41 PM
// Design Name: 
// Module Name: LIFO_Stack
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


module LIFO_Stack #(parameter WL = 8, DEPTH = 16)
                   (input CLK, RST, rReq, wReq,
                    input [WL-1:0] din,
                    output Full, Empty, Error,
                    output reg [WL-1:0] dout);

    reg [WL-1:0] stack [DEPTH-1:0];
    
    integer sp;
    integer i;
  
    always @(posedge CLK) begin
        if(!RST) begin
            sp <= 0;
            i <= 0;
            dout <= 0;
            for(i = 0; i < DEPTH; i = i + 1) begin
                stack[i] <= 0;
            end
        end
        else begin
        
            //pop operation
            if(rReq) begin
                if(!Empty) begin
                    dout <= stack[sp-1];
                    sp <= sp - 1;
                end
                else if(!Empty && wReq) begin
                    dout <= stack[sp-1];
                    sp <= sp;
                end
            end
            
            //push operation
            if(wReq) begin
                if(!Full && !rReq) begin
                    stack[sp] <= din;
                    sp <= sp + 1;
                end
                else if(!Full && rReq) begin
                    stack[sp-1] <= din;
                    sp <= sp;
                end
            end
            
        end
    end
    
    assign Full = (sp >= DEPTH) ? 1:0;
    assign Empty = (sp <= 0) ? 1:0;
    assign Error = ((wReq && Full) || (rReq && Empty)) ? 1:0;
endmodule
