`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2026 02:55:28 PM
// Design Name: 
// Module Name: SAR_Logic
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


module SAR_Logic(
    input clk,
    input comparator,
    output [7:0] JA
    );
    
    reg [7:0] data;
    reg [2:0] current_state, next_state;
    parameter b0 = 8'b10000000,
              b1 = 8'b01000000,
              b2 = 8'b00100000,
              b3 = 8'b00010000,
              b4 = 8'b00001000,
              b5 = 8'b00000100,
              b6 = 8'b00000010,
              b7 = 8'b00000001;
    
    assign JA[1] = data;
    
    // TODO: figure out how to send data output to the comparator.
    // Figure out what signal the comparater sends out, and if we need to convert it to digital or not.
    // How to change one bit of data[n] to a one, then either keep the one or change to zero depending on the comparator output.
    // -- Probably use an "or" statement to "or" together b[n] parameters and the data[n] to change the selected bit value to a one. --
    
    
    always @ (posedge clk)
    begin: STATE_MEMORY
        current_state <= next_state;
    end
    
    
    
    always @ (*)
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
    
    
    
    always @ (*)
    begin: OUTPUT_LOGIC                             
        case (current_state)                        
            b0: begin 
            data = 0;                                // reset data back to zero
            data = data || b0;                       // 1000 0000 is sent to the DAC to then be sent out to the comparator
            data[0] = comparator ? 1'b1 : 1'b0; end  // if true is sent back, set the first bit in data to 1; else set first bit to 0
            
            b1: begin 
            data = data || b1;
            data[1] = comparator ? 1'b1 : 1'b0; end
            
            b2: begin
            data = data || b2;
            data[2] = comparator ? 1'b1 : 1'b0; end
            
            b3: begin
            data = data || b3;
            data[3] = comparator ? 1'b1 : 1'b0; end
            
            b4: begin
            data = data || b4;
            data[4] = comparator ? 1'b1 : 1'b0; end
            
            b5: begin
            data = data || b5;
            data[5] = comparator ? 1'b1 : 1'b0; end
            
            b6: begin
            data = data || b6;
            data[6] = comparator ? 1'b1 : 1'b0; end
            
            b7: begin
            data = data || b7;
            data[7] = comparator ? 1'b1 : 1'b0; end
        endcase
    end

endmodule

