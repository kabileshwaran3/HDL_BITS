module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
	
    parameter [3:0]
    		  s0 = 3'b000,
    		  s1 = 3'b001,
    		  s2 = 3'b010,
    		  s3 = 3'B100,
    		  s4 = 3'B101;
    reg[3:0] state , next_state;
    
    always @(*)
        begin 
            case(state)
                	s0 : next_state = s1;
					s1 : next_state = s2;
					s2 : next_state = s3;
					s3 : next_state = s4;
					s4 : next_state = s4;
					
            endcase
        end
    
    always@(posedge clk)
        state <= (reset) ? s0 : next_state;
    
    assign shift_ena = (state == s1)|(state == s2)|(state == s3)|(state == s0);

endmodule
