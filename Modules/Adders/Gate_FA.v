`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 05:53:46 PM
// Design Name: 
// Module Name: Gate_FA
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


module Gate_FA(input a, b, c_in, 
               output sum, c_out);

    wire x,y,z;
    
    //gates for output sum
    xor m1(x, a, b);
    xor m2(sum, x, c_in);
    
    //gates for c_out
    and m3(y, a, b);
    and m4(z, c_in, x);
    or m5(c_out, y, z);
    
endmodule
