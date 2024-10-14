`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2023 11:10:45 AM
// Design Name: 
// Module Name: BSA
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


module BSA #(parameter WL = 4)
            (input [WL-1:0] a,b,
             input CLK, RST, Load,
             output sbit);
    
    wire A,B, carryOut, carryIn, s;
    //Inputs a,b in two RSR registers
    Parallel_RSR #(.BITS(WL)) RSRA (.data(a), .CLK(CLK), .RST(RST), .Load(Load), .In(0), .SO(A));
    Parallel_RSR #(.BITS(WL)) RSRB (.data(b), .CLK(CLK), .RST(RST), .Load(Load), .In(0), .SO(B));
    
    //Add the bits
    Dataflow_FA FA1 (.a(A), .b(B), .c_in(carryIn), .sum(s), .c_out(carryOut));
    
    //Carry Flip Flop
    Nbit_Register #(.N(1)) carryFF (.d(carryOut), .CLK(CLK), .RST(RST), .q(carryIn));
    
    //Sum Register
    Serial_RSR #(.BITS(WL+1)) SumRSR (.data(s), .CLK(CLK), .RST(RST), .SO(sbit));
    
    
endmodule
