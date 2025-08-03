module top_module ( input [1:0] A, input [1:0] B, output z ); 
    wire f1;
    assign z=(A==B)? 1'b1:1'b0;

endmodule
