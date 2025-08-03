module top_module (
    input clk,
    input in, 
    output reg  out);
	wire out_n;
    assign out_n =out;
    wire k1;
    assign k1=in^out_n;
    always@(posedge clk)
        begin
           out<=k1; 
        end
endmodule
