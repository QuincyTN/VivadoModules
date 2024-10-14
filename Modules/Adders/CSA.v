`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 08:20:09 PM
// Design Name: 
// Module Name: CSA
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


module CSA(input [15:0] a,b, 
           input c_in, 
           output [15:0] sum, 
           output c_out);
           
    wire carry1, carry2, carry3, carry4, carry5, carry6, carry7, carry8, carry9;
    //ATM reperesents adder to mux wire conncection
    wire [3:0] ATM1, ATM2, ATM3, ATM4, ATM5, ATM6;
    
    //First 1-4 bits of sum
    RCA_4b adder1(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .sum(sum[3:0]), .c_out(carry1));
    
    //Calculate bits 5-8
    RCA_4b adder2(.a(a[7:4]), .b(b[7:4]), .c_in(1), .sum(ATM1[3:0]), .c_out(carry2));
    RCA_4b adder3(.a(a[7:4]), .b(b[7:4]), .c_in(0), .sum(ATM2[3:0]), .c_out(carry3));
    
    //Select bits if carry1 is 1/0
    MUX_2to1 mux1(.sel(carry1), .in_1(ATM1[0]), .in_2(ATM2[0]), .mux_out(sum[4]));
    MUX_2to1 mux2(.sel(carry1), .in_1(ATM1[1]), .in_2(ATM2[1]), .mux_out(sum[5]));
    MUX_2to1 mux3(.sel(carry1), .in_1(ATM1[2]), .in_2(ATM2[2]), .mux_out(sum[6]));
    MUX_2to1 mux4(.sel(carry1), .in_1(ATM1[3]), .in_2(ATM2[3]), .mux_out(sum[7]));
    
    //c_in bit for adder4, adder5 from adder2, adder3
    MUX_2to1 mux5(.sel(carry1), .in_1(carry2), .in_2(carry3), .mux_out(carry4));
    
    //Calculate bits 9-12
    RCA_4b adder4(.a(a[11:8]), .b(b[11:8]), .c_in(1), .sum(ATM3[3:0]), .c_out(carry5));
    RCA_4b adder5(.a(a[11:8]), .b(b[11:8]), .c_in(0), .sum(ATM4[3:0]), .c_out(carry6));
    
    //Select bits if carry4 is 1/0
    MUX_2to1 mux6(.sel(carry4), .in_1(ATM3[0]), .in_2(ATM4[0]), .mux_out(sum[8]));
    MUX_2to1 mux7(.sel(carry4), .in_1(ATM3[1]), .in_2(ATM4[1]), .mux_out(sum[9]));
    MUX_2to1 mux8(.sel(carry4), .in_1(ATM3[2]), .in_2(ATM4[2]), .mux_out(sum[10]));
    MUX_2to1 mux9(.sel(carry4), .in_1(ATM3[3]), .in_2(ATM4[3]), .mux_out(sum[11]));
    
    
    //c_in bit for adder6, adder7 from adder4, adder5
    MUX_2to1 mux10(.sel(carry4), .in_1(carry5), .in_2(carry6), .mux_out(carry7));
    
    //Calculate bits 9-12
    RCA_4b adder6(.a(a[15:12]), .b(b[15:12]), .c_in(1), .sum(ATM5[3:0]), .c_out(carry8));
    RCA_4b adder7(.a(a[15:12]), .b(b[15:12]), .c_in(0), .sum(ATM6[3:0]), .c_out(carry9));
    
    //Select bits if carry7 is 1/0
    MUX_2to1 mux11(.sel(carry7), .in_1(ATM5[0]), .in_2(ATM6[0]), .mux_out(sum[12]));
    MUX_2to1 mux12(.sel(carry7), .in_1(ATM5[1]), .in_2(ATM6[1]), .mux_out(sum[13]));
    MUX_2to1 mux13(.sel(carry7), .in_1(ATM5[2]), .in_2(ATM6[2]), .mux_out(sum[14]));
    MUX_2to1 mux14(.sel(carry7), .in_1(ATM5[3]), .in_2(ATM6[3]), .mux_out(sum[15]));
    
    //Select c_out
    MUX_2to1 mux15(.sel(carry7), .in_1(carry8), .in_2(carry9), .mux_out(c_out));
    
    
endmodule
