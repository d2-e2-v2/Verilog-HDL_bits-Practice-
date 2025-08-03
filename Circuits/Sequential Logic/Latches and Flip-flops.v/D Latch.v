module top_module (
    input d, 
    input ena,
    output reg q);
    always@( ena)
	 q<= ena ? d:q;
endmodule
