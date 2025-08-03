module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    wire[2:0] carry; 
    assign cout=carry;
    full_add k1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(carry[0]));
    full_add k2(.a(a[1]),.b(b[1]),.cin(carry[0]),.sum(sum[1]),.cout(carry[1]));
    full_add k3(.a(a[2]),.b(b[2]),.cin(carry[1]),.sum(sum[2]),.cout(carry[2]));
    
endmodule
module full_add(a,b,cin,cout,sum);
    input a,b,cin;
    output sum, cout;
    assign sum= a^b^cin;
    assign cout=(a^b)&cin | a&b; 
endmodule
    
