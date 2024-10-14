`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 04:38:53 PM
// Design Name: 
// Module Name: PIPO_LSR
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


module PIPO_LSR #(parameter BITS = 4)
                 (input [BITS-1:0] data,
                  input CLK, RST, Load, In,
                  output reg [BITS-1:0] out);
                  
    always @(posedge Load or posedge RST or posedge CLK) begin
        if(RST) out <= 0;
        else if(Load) out <= data;
        else out <= {out[BITS-2:0], In};
    end
    
endmodule
