module top_module (
    input clk,
    input x,
    output z
); 
    wire xor_out,and_out,or_out;
    reg q1,q2,q3;
       initial // not usally used just for assurance
       
   begin
       q1=0;
       q2=0;
       q3=0;
   end
    
    assign xor_out=x^q1;
    assign and_out=x&(~q2);
    assign or_out=x|(~q3);
    nor nor1(z,q1,q2,q3);

    always@(posedge clk)
        begin
     q1<=xor_out;
       q2<=and_out;
       q3<=or_out;
        end

endmodule
