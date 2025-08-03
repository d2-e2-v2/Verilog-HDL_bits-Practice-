module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    parameter [9:0] S0 = 10'b0000000001;
    parameter [9:0] S1 = 10'b0000000010;
    parameter [9:0] S2 = 10'b0000000100;
    parameter [9:0] S3 = 10'b0000001000;
    parameter [9:0] S4 = 10'b0000010000;
    parameter [9:0] S5 = 10'b0000100000;
    parameter [9:0] S6 = 10'b0001000000;
    parameter [9:0] S7 = 10'b0010000000;
    parameter [9:0] S8 = 10'b0100000000;
    parameter [9:0] S9 = 10'b1000000000;

    
    assign next_state[0]=( (state[0] | state[1] | state[2] | state[3] | state[4] | state[7] | state[8] | state[9]) && ~in );
    assign next_state[1]=( state[9]&in | state[8]&in| state[0]&(in));
    assign next_state[2]=(state[1]&in);
    assign next_state[3]=(state[2]&in);
    assign next_state[4]=(state[3]&in);
    assign next_state[5]=(state[4]&in);
    assign next_state[6]=(state[5]&in);
    assign next_state[7]=(state[6]& in | state[7]&in);
    assign next_state[8]=(state[5]&~in);
    assign next_state[9]=(state[6]&~in);
    
    assign out1=(state[8]| state[9]);
    assign out2=( state[7] | state[9]);
    
    
endmodule
