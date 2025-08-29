module top_module (
    input clk,
    input x,
    output z
); 
  reg [2:0]y;
    
    always@(posedge clk) begin
        y[0]=x^y[0];
        y[1]=x&~y[1];
      y[2]=x|~y[2];
    end
  assign z=~(y[0]|y[1]|y[2]);
endmodule
