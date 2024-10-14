`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2023 05:06:10 PM
// Design Name: 
// Module Name: unsignedDiv
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


module unsignedDiv #(parameter N = 8)
                    (input valid, CLK, RST, 
                     input [N-1:0] divisor, dividend,
                     output reg ready,
                     output reg [N-1:0] quotient, remainder);

    //state definitions
    localparam IDLE = 0, OP = 1, LAST = 2, DONE = 3;    
    
    reg [1:0] current_state, next_state;
    reg q;
    reg [N-1:0] d, rh_temp, rh, rl, counter;
    
    //sequential state logic
    always @(posedge CLK or posedge RST) begin
        if(RST) begin current_state <= IDLE; 
                      counter <= 0; 
                      d <= 0;
                      rh_temp <= 0;
                      q <= 0;
                      rh <= 0;
                      rl <= 0;
                      end
        else current_state <= next_state;
    end
    
    //next_state logic
    always @(valid, current_state,counter) begin
        case(current_state) 
            IDLE: next_state = (valid) ? OP : IDLE;
            OP: next_state = (counter < N-1) ? OP : LAST;
            LAST: next_state = DONE;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase  
    end
    
    //combinational logic and output
    always @(valid, posedge CLK) begin
        case(current_state)
            IDLE: if(valid) begin
                    d = divisor;
                    rl = dividend;
                    rh = 0;
                    ready = 0;
                   end           
            OP: begin
                    if(rh >= d) begin
                        rh_temp = rh - d;
                        q = 1;
                    end
                    else begin
                        rh_temp = rh;
                        q = 0;
                    end
                    {rh, rl} = {rh_temp[N-2:0], rl, q};
                    counter = counter + 1;
                end
            LAST: begin
                    if(rh >= d) begin
                        rh_temp = rh - d;
                        q = 1;
                    end
                    else begin
                        rh_temp = rh;
                        q = 0;
                    end
                    rl = {rl[N-2:0],q}; 
                    rh = rh_temp;  
                  end
            DONE: begin
                    counter = 0;
                    quotient = rl;
                    remainder = rh;
                    ready = 1;
                  end
        endcase
    end
    
endmodule
