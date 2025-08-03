/////////////////////////


module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output   out);
    wire [3:0] d;
    d_ff k1(.clk(clk),.resetn(resetn),.q(in),.d(d[0]));
    d_ff k2(.clk(clk),.resetn(resetn),.q(d[0]),.d(d[1]));
    d_ff k3(.clk(clk),.resetn(resetn),.q(d[1]),.d(d[2]));
    d_ff k4(.clk(clk),.resetn(resetn),.q(d[2]),.d(out));   

endmodule


module d_ff(q,clk,d,resetn);
    
    input q,clk,resetn;
    output reg  d;
    always@(posedge clk)
        begin
        d<= !resetn ? 1'b0:q;
        end 
endmodule
// this can also be implemented without making any modules
// but I like the structural approach

       
    

