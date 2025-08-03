module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    wire carry;
    fulladdertop j1(.sum1(sum[0]),.cout1(cout[0]),.a1(a[0]),.b1(b[0]),.cin1(cin));
    genvar k;
    
    generate 
        for( k=1; k<$bits(a);k=k+1) 
         begin : full_lopp
             fulladdertop ki(.sum1(sum[k]),.cout1(cout[k]),.a1(a[k]),.b1(b[k]),.cin1(cout[k-1]));
         end
     endgenerate
            
             

endmodule
             
     module fulladdertop(sum1, cout1, a1,b1,cin1);

    input a1,b1,cin1;
    output sum1,cout1;
    wire  stuff,stuff1,stuff2;
    xor x1(stuff, a1,b1);
    xor  x2(sum1,stuff,cin1);
    and  la(stuff2,a1,b1);
    and and2(stuff1,stuff,cin1);
    or or1(cout1, stuff1, 
    stuff2); 


endmodule