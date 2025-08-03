module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    mux_dff k1(.clk(KEY[0]),.w(KEY[3]),.E(KEY[1]),.L(KEY[2]),.R(SW[3]),.Q(LEDR[3]));
    mux_dff k2(.clk(KEY[0]),.w(LEDR[3]),.E(KEY[1]),.L(KEY[2]),.R(SW[2]),.Q(LEDR[2]));
    mux_dff k3(.clk(KEY[0]),.w(LEDR[2]),.E(KEY[1]),.L(KEY[2]),.R(SW[1]),.Q(LEDR[1]));
    mux_dff k4(.clk(KEY[0]),.w(LEDR[1]),.E(KEY[1]),.L(KEY[2]),.R(SW[0]),.Q(LEDR[0]));

endmodule


module mux_dff (
    input clk,
    input w, R, E, L,
    output Q
);
	wire out_0,out_1;
    assign out_0= E ? w : Q;
    assign out_1= L ?  R  : out_0;
    always@(posedge clk)
        Q <= out_1;
    
    
    
    
    
    
endmodule



