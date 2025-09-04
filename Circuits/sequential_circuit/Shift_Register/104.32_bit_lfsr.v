module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    always@(posedge clk)
        if(reset)
            q <= 1'b1;
        else begin
            q <= q[31:1];
            q[31] <= q[0];
            q[21] <= q[22] ^ q[0];
            q[1] <= q[2] ^ q[0];
            q[0] <= q[1] ^ q[0];
            
        end       

endmodule
