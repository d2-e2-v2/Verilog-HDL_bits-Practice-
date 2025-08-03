module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    reg [3:0] prev_q;
    always@(posedge clk)
        begin
        q<= reset ? 4'b0: ~(slowena) ?  q : (q[3]&q[0]) ? 4'b0 :q+1'b1;
    
    end

endmodule
