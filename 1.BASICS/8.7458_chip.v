module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire n1,n2,n3,n4,n5,n6;
   assign n1= p2a & p2b;
   assign n2= p2c & p2d;
   assign n3= p1a & p1c & p1b;
   assign n4= p1f & p1e & p1d;
   assign n5= n1 | n2;
   assign n6= n3 | n4;
   assign p2y= n5;
   assign p1y=  n6;


endmodule
