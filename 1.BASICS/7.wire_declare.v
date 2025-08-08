`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire n1,n2,n3;
    assign n1= a & b;
    assign n2= c & d;
    assign n3= n1 | n2;
    assign out= n3;
    assign out_n= ~n3;

endmodule
