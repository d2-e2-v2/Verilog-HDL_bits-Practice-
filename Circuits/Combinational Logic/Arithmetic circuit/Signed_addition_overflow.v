module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] carry;
     full_add k1(.x(x[0]),.y(y[0]),.cin(0),.sum(sum[0]),.cout(carry[0]));
    full_add k2(.x(x[1]),.y(y[1]),.cin(carry[0]),.sum(sum[1]),.cout(carry[1]));
    full_add k3(.x(x[2]),.y(y[2]),.cin(carry[1]),.sum(sum[2]),.cout(carry[2]));
        full_add k4(.x(x[3]),.y(y[3]),.cin(carry[2]),.sum(sum[3]),.cout(sum[4]));


endmodule
module full_add(x,y,cin,cout,sum);
    input x,y,cin;
    output sum, cout;
    assign sum= x^y^cin;
    assign cout=(x^y)&cin | x&y; 
endmodule