`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 10:31:56 AM
// Design Name: 
// Module Name: Parallel_LSR
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


module Parallel_LSR #(parameter BITS = 4)
                     (input [BITS-1:0] data,
                      input CLK, RST, Load, In,
                      output out);
                      
    reg [BITS-1:0] tmp;
    always @(posedge CLK or posedge RST or posedge Load) begin
        if(RST) tmp <= 0;
        else if (Load) tmp <= data;
        else tmp <= {tmp[BITS-2:0], In};
        
    end
    assign out = tmp[BITS-1];
    
endmodule
