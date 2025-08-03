module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and=&in;
    assign out_or=|in;
    xor xor1(out_xor,in[0],in[1],in[2],in[3]);

endmodule
