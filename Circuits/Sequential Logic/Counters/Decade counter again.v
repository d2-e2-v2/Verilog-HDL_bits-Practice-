module top_module (
    input clk,
    input reset,
    output [3:0] q);
    always@(posedge clk)
begin
    q<= reset ? 4'b0001 : (q[3] &q[1]) ? 4'b0001 : q+1'b1; 
end 
endmodule
