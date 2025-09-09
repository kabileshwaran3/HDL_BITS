module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter [2:0]A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;
    reg [2:0]state,next_state;
    
    always@(posedge clk)begin
        if(reset)
           state<=A;
        else
           state<=next_state;
    end
    always@(*)begin
        case(state)
            A:next_state=(x==0)?A:B;
            B:next_state=(x==0)?B:E;
            C:next_state=(x==0)?C:B;
            D:next_state=(x==0)?B:C;
            E:next_state=(x==0)?D:E;
        endcase
    end
    assign z=(state==D|state==E);
    
          

endmodule
