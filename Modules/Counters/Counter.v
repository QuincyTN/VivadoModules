`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 02:04:05 PM
// Design Name: 
// Module Name: Counter
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


module Counter #(parameter WIDTH = 8)
                (input EN, CLK, RST,
                 output [WIDTH-1:0] ctr);

    reg [WIDTH-1:0] tmp;
    always @(posedge CLK or posedge RST) begin
        if(RST) tmp <=0 ;
        else if (EN) tmp <= tmp + 1;
    end
    assign ctr = tmp;
endmodule
