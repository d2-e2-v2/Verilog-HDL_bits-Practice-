module top_module (
    input clk,
    input j,
    input k,
    output Q); 
	wire k1,k2,k3;
    wire out_n=Q;
    assign k1=(j&(~out_n));
    assign k2=((~k)&(out_n));
    assign k3=( k1 | k2);
    always@(posedge clk)
        begin
            Q<=k3;
        end
endmodule


