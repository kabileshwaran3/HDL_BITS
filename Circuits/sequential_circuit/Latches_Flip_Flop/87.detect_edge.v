module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
); reg [7:0] in_reg;
    always @(posedge clk) begin
        in_reg <= in;
    end
    always @(posedge clk) begin
        pedge <= in & ~in_reg;
    end
endmodule
