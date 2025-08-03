module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] cond1,cond2,cond3,cond4,cond5,cond6;
    assign cond1= a>b? b:a;
    assign cond2= b>c ? c:b;
    assign cond3= b>d ? d:b;
    assign cond4=cond1>cond2 ? cond2:cond1;
    assign cond5=cond1>cond3 ? cond3:cond1;
    assign cond6=cond4>cond5 ? cond5: cond4;
    assign min=cond6;
    

    // assign intermediate_result1 = compare? true: false;

endmodule
