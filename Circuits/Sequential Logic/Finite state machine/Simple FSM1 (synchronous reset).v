// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    
		parameter A=1'b0;
    parameter B=1'b1;
    // Fill in state name declarations

    reg present_state, next_state;
    
    always@(posedge clk) // state transition logic
        begin
            if(reset)
                present_state<=B;
            else
                present_state<=next_state;
        end
    
    always@(*) // next state  combinational
            begin
                case(present_state)
                    
				    A: next_state= in ? A:B;
                    B: next_state= in ? B:A;  
                        endcase
        end 
    
    always@(*)
        begin
        
         out= present_state ? B:A; 
            
        end


endmodule
