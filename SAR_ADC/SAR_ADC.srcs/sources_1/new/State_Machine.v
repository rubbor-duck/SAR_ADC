`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2026 12:57:12 PM
// Design Name: 
// Module Name: State_Machine
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


module State_Machine(
    input clk,
    output reg data
    );
    
    reg [2:0] current_state, next_state;
    parameter b0,
              b1,
              b2,
              b3,
              b4,
              b5,
              b6,
              b7;
    
    
    
    
    always @ (posedge clk)
    begin: STATE_MEMORY
        current_state <= next_state;
    end
    
    
    
    always @ (current_state)
    begin: NEXT_STATE_LOGIC
        case (current_state)
            b0 : next_state = b1;
            b1 : next_state = b2;
            b2 : next_state = b3;
            b3 : next_state = b4;
            b4 : next_state = b5;
            b5 : next_state = b6;
            b6 : next_state = b7;
            b7 : next_state = b0;
            default : next_state = b0;
        endcase
    end
    
    
    
    always @ (current_state)
    begin: OUTPUT_LOGIC
        data = current_state;
    end

endmodule
