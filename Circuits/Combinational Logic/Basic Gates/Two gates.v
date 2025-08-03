module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire k1;
    xnor xnor1(k1,in1,in2);
    xor  xor1(out,k1,in3);

endmodule
