module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    wire q_n=q;
    always@(posedge clk)
        begin
            q<= reset ? 4'b0 : (q[3]&q[0]) ? 4'b0:q+1'b1;
        end

endmodule
