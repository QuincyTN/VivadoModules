`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2023 05:26:25 PM
// Design Name: 
// Module Name: tb_TrafficController
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


module tb_TrafficController;
    reg ns_traffic, ew_traffic, sw_ne_traffic, wn_es_traffic, CLK, RST;
    wire [2:0] ns_light, ew_light, sw_ne_light, wn_es_light;
    
    TrafficController  controller1 (.CLK(CLK),
                                    .RST(RST),
                                    .ns_traffic(ns_traffic),
                                    .ew_traffic(ew_traffic),
                                    .sw_ne_traffic(sw_ne_traffic),
                                    .wn_es_traffic(wn_es_traffic),
                                    .ns_light(ns_light),
                                    .ew_light(ew_light),
                                    .sw_ne_light(sw_ne_light),
                                    .wn_es_light(wn_es_light));
    always begin
        CLK = 0; #5;
        CLK = 1; #5;
    end
   
    integer i = 0;
    initial begin
        RST = 1; @(posedge CLK); RST = 0;
        for(i = 0; i < 10; i = i+1) begin          
            if(i%5 == 0) begin ns_traffic = 1; ew_traffic = 0; sw_ne_traffic = 0; wn_es_traffic = 0; end
            if(i%5 == 1) begin ns_traffic = 0; ew_traffic = 1; sw_ne_traffic = 0; wn_es_traffic = 0; end
            if(i%5 == 2) begin ns_traffic = 0; ew_traffic = 0; sw_ne_traffic = 1; wn_es_traffic = 0; end
            if(i%5 == 3) begin ns_traffic = 0; ew_traffic = 0; sw_ne_traffic = 0; wn_es_traffic = 1; end
            if(i%5 == 4) begin ns_traffic = 0; ew_traffic = 0; sw_ne_traffic = 0; wn_es_traffic = 0; end
            repeat(5)@(posedge CLK);
        end

        $finish;
    end
endmodule
