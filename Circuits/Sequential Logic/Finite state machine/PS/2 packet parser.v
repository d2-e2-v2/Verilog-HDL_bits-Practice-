module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    reg [2:0] state,next_state;
    parameter A=0,B=1,C=2,D=3,A1=4,A2=5;
    
   
    // State transition logic (combinational)
    always@(*)
        begin
            case(state)
                A: next_state=in[3] ? B:A;
                B: next_state=D;
                D: next_state=C;
                C: next_state= in[3] ? B:A; 
            endcase
                end
                
    

    // State flip-flops (sequential)
                always@(posedge clk)
                    begin
                        if(reset)
                            state<=A;
                        else
                            state<=next_state;
                    end
                
    
 
    // Output logic
                assign done=(state==C);

endmodule
