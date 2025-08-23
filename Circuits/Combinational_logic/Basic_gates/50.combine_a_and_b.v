module top_module (input x, input y, output z);
	wire x1,x2,x3,x4;
    wire y1,y2;
    A a1(x,y,x1);
    A a2(x,y,x2);
    B b1(x,y,x3);
    B b2(x,y,x4);
    or(y1,x1,x2);
    and(y2,x3,x4);
    xor(z,y1,y2);
    
    
endmodule

module B ( input x, input y, output z );
    assign z=~(x^y);

endmodule
module A (input x, input y, output z);
    assign z=(x^y)&x;

endmodule
