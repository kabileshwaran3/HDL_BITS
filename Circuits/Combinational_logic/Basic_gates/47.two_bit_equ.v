module top_module ( input [1:0] A, input [1:0] B, output z ); 
    always @ (*)
        if (A == B) begin
        z=1'b1;
    end
    else 
        z=1'b0;
endmodule
