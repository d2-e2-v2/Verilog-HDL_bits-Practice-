module top_module (
    input clk,
    input d,
    output q
);
    reg prev_d1,prev_d2;
    wire flag1,flag2;
    assign flag1=prev_d1;
    assign flag2=prev_d2;
  // the assign of q will be done at each edge
  // so we store the value of d in two regs and use in a combinational logic
    always@(posedge clk)
        begin
            prev_d1<=d;
        end
    always@(negedge clk)
        begin
            prev_d2<=d;
        end
    
    assign q= clk ? flag1:flag2; // combinational logic to detect all possible changes in change

endmodule

// make sure to check the answer given at the website
// great for proper understanding