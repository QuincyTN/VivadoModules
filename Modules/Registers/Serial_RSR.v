`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2023 05:27:03 PM
// Design Name: 
// Module Name: Serial_RSR
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


module Serial_RSR #(parameter BITS = 4)
                   (input data,
                    input CLK, RST,
                    output SO);
    reg [BITS-1:0] tmp; 
    always @(posedge CLK or posedge RST) begin
        if(RST) tmp <= 0;
        else tmp <= {data, tmp[BITS-1:1]};
    end
    assign SO = tmp[0];
endmodule
