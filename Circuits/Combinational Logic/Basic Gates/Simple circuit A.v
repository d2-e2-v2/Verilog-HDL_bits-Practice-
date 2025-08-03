module top_module (input x, input y, output z);
    assign z=((~y)&x);
endmodule
