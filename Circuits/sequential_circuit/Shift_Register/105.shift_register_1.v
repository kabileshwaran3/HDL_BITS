module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0] o;
    
    always@(posedge clk) begin
        if (resetn) begin
            o[0]<=in;
            o[1]<=o[0];
            o[2]<=o[1];
            out<=o[2];
        end
        else begin
            o<=3'b0;
            out<=1'b0;
    	end
    end
endmodule
