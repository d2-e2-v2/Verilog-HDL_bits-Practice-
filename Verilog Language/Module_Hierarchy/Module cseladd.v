module top_module(
    input [31:0] a,
    input [31:0] b,
    output  [31:0] sum
);
    wire sel;
    wire [15:0] sum1,sum2;
    add16 k1 (.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum[15:0]),.cout(sel));
    add16 k2(.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(sum1[15:0]));
    add16 k3 (.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(sum2[15:0]));
   
    assign sum[31:16]=(sel) ? sum2: sum1;
    

endmodule

// lesson if you want to use 'if' in combinaltional logic
// either use "?" operator wih assign
// or use  always@(*), which which needs the output to become a reg

