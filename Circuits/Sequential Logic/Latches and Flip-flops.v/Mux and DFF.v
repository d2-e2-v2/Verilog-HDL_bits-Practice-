module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    wire Q_n;
    assign Q_n=Q;
    wire q0,q1,q1_xor;
    
  	assign q0= L ? r_in : q_in;
    always@(posedge clk)
        begin
            Q <= q0;
        end 
    
    

endmodule

