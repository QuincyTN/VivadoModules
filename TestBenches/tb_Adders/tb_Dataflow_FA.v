`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 07:52:29 PM
// Design Name: 
// Module Name: tb_Dataflow_FA
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


module tb_Dataflow_FA;

     reg [2:0] in; 
     wire sum, c_out;
     
     Dataflow_FA adder1 (.a(in[0]), .b(in[1]), .c_in(in[2]), .sum(sum), .c_out(c_out));
     
     initial begin
        in = 3'b000;
        #5;
        in = 3'b001;
        #5;
        in = 3'b010;
        #5;
        in = 3'b011;
        #5;
        in = 3'b100;
        #5;
        in = 3'b101;
        #5;
        in = 3'b110;
        #5;
        in = 3'b111;
        #5;
        in = 3'b000;
     
     $finish;
     end
endmodule
