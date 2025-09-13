module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter [1:0]	idle = 2'B00,
    			S1 = 2'B01,
    			S2 = 2'B10;

    reg[1:0] ps , ns;
   reg zz;
    
    always_comb
        begin 
            case(ps)
            idle: ns = x ? S1: idle;
              S1: ns = x ? S2:   S1;
              S2: ns = x ? S2:   S1;
            endcase
        end
    
    
    always @(posedge clk or posedge areset)
    begin 
        ps <= (areset) ? idle : ns;
    end
	
    assign z = (ps == S1)? 1'b1 : 1'b0;
endmodule
