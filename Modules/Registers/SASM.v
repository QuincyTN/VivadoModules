`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 02:14:00 PM
// Design Name: 
// Module Name: SASM
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


module SASM #(parameter WL = 4)
             (input [(2*WL)-1:0] a,
              input [WL-1:0] b,
              input CLK,RST,Load);
    
    wire [(2*WL)-1:0] multiplicand, partialP, productIn, productOut;
    wire multiplier;
    
    //Multiplicand
    PIPO_LSR #(.BITS(2*WL)) LSRA (.data(a), .CLK(CLK), .RST(RST), .Load(Load), .In(0), .out(multiplicand));
    //Multiplier
    Parallel_RSR #(.BITS(WL)) RSRB (.data(b), .CLK(CLK), .RST(RST), .Load(Load), .In(0), .SO(multiplier));
    //Product
    Nbit_Register #(.N(2*WL)) regP (.d(productIn), .CLK(CLK), .RST(RST), .q(productOut));
    
    //Multiplexer
    Nbit_2to1_Mux #(.N((2*WL))) MUX1(.a(multiplicand), .b(0), .sel(multiplier), .out(partialP));
    //Adder
    Nbit_Adder #(.N(2*WL)) ADDER1 (.a(partialP), .b(productOut), .c_in(0), .sum(productIn));
    

endmodule
