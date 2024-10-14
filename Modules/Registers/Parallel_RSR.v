`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 08:06:56 PM
// Design Name: 
// Module Name: Parallel_RSR
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


module Parallel_RSR #(parameter BITS = 4)
                     (input [BITS-1:0] data,
                      input CLK, RST, Load, In,
                      output SO);
                      
    reg [BITS-1:0] tmp;
    always @(posedge CLK or posedge RST or posedge Load) begin
        if(RST) tmp <= 0;
        else if (Load) tmp <= data;
        else tmp <= {In, tmp[BITS-1:1]};
    end
    assign SO = tmp[0];
endmodule
