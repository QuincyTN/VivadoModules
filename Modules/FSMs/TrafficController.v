`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2023 08:02:22 PM
// Design Name: 
// Module Name: TrafficController
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


module TrafficController #(parameter DELAY = 2)
                          (input ns_traffic, ew_traffic, sw_ne_traffic, wn_es_traffic, CLK, RST,
                           output reg [2:0] ns_light, ew_light, sw_ne_light, wn_es_light);
    //S1 = Idle, S2 = Red, S3 = Green, S4 = Yellow
    localparam S1 = 0, S2 = 1, S3 = 2, S4 = 3;
   
    localparam [2:0] red = 3'b100, yellow = 3'b010, green = 3'b001;
    localparam delay = 1+$rtoi($ceil($clog2(DELAY)));
    reg [1:0] next_state, current_state;    
    
    //state register sequential logic
    always @(posedge CLK or posedge RST) begin
        if (RST) current_state <= S1; 
        else current_state <= next_state;
    end
    
    //Mealy FSM because the output is dependent on the current state and the inputs
    //next state and output combinational logic
    always @(ns_traffic,ew_traffic,sw_ne_traffic,wn_es_traffic) begin
        next_state = current_state;
        case(current_state) 
            S1: begin
                next_state = S3;
                ns_light = green; ew_light = red; sw_ne_light = red; wn_es_light = red;
                end

            S3: begin
                next_state = S4;
                if(ns_light == green) begin ns_light = yellow; ew_light = red; sw_ne_light = red; wn_es_light = red; end
                else if(ew_light == green) begin ns_light = red; ew_light = yellow; sw_ne_light = red; wn_es_light = red; end
                else if(sw_ne_light == green) begin ns_light = red; ew_light = red; sw_ne_light = yellow; wn_es_light = red; end
                else if(wn_es_light == green) begin ns_light = red; ew_light = red; sw_ne_light = red; wn_es_light = yellow; end
                else begin ns_light = red; ew_light = red; sw_ne_light = red; wn_es_light = red; end
                end
        endcase
        
    end
    always @(ns_traffic,ew_traffic,sw_ne_traffic,wn_es_traffic,current_state) begin
        if(current_state == S2) begin
            next_state = S3;
            if(ew_traffic) begin ns_light = red; ew_light = green; sw_ne_light = red; wn_es_light = red; end
            else if(sw_ne_traffic) begin ns_light = red; ew_light = red; sw_ne_light = green; wn_es_light = red; end
            else if(wn_es_traffic) begin ns_light = red; ew_light = red; sw_ne_light = red; wn_es_light = green; end
            else begin ns_light = green; ew_light = red; sw_ne_light = red; wn_es_light = red; end
        end
        else if(current_state == S4) begin
            next_state = S2;
            ns_light = red; ew_light = red; sw_ne_light = red; wn_es_light = red;
        end
    end
endmodule
