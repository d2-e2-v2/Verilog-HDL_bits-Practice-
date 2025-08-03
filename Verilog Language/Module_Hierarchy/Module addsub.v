
// approach 1- Use replication and concatenation
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire [31:0] xor_b;
wire carry,cout;
assign xor_b={ 31{sub}} ^ {31{b}};
add16 k1(.a(a[15:0]),.b(xor_b[15:0]),.cin(0),.sum(sum[15:0]),.cout(carry));
add16 k2(.a(a[31:16]),.b(xor_b[31:16]),.cin(carry),.sum(sum[31:16]));

endmodule

// second apporach can use using mux which is far worser in terms of code
// we can use "~ " in this case to make negative vector


module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire [31:0] b_n;
wire [31:0] xor_b;
assign b_n=~b;
assign xor_b=(sub)  ? b_n : b;
wire carry,cout;
    add16 k1(.a(a[15:0]),.b(xor_b[15:0]),.cin(sub),.sum(sum[15:0]),.cout(carry));
add16 k2(.a(a[31:16]),.b(xor_b[31:16]),.cin(carry),.sum(sum[31:16]));

endmodule

///                      Learning                                /// 


//.when subtracting using full adder we use 2'c complement method
// So, cin for the first adder won't be zero rather dependent
// cin=1 for sub, and cin=0 for add for int_signed