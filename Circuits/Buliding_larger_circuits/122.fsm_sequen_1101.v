module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    
    parameter[2:0] 
    				s0 = 3'B000,
    				s1 = 3'B001,
    				s2 = 3'B010,
    				s3 = 3'B011,
    				s4 = 3'B100;
    reg [2:0] state , next_state;
    
    always_comb
        begin 
            case(state)
    	    s0 : next_state = data ? s1 : s0 ;		        
    	    s1 : next_state = data ? s2 : s0 ;		
    	    s2 : next_state = data ? s2 : s3 ;		
    	    s3 : next_state = data ? s4 : s0 ;
            s4: next_state = s4;
            endcase
        end
    
    always@(posedge clk)
        state <= (reset) ?  s0 : next_state;
    
    
    
    assign start_shifting = (state == s4); 
    
endmodule
