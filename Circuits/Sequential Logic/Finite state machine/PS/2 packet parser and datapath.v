module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    reg[7:0] storage;
    reg [2:0] state,next_state;
parameter A=0,B=1,C=2,D=3;
    always@(posedge clk)
        begin
            if(reset)
                begin
                state<=A;
                end 
            else
                begin
                state<=next_state;
          
                end
        end
    
    always@(*)// state logic
        begin
            case(state)
           A:
            begin
                next_state= in[3] ?      B:A;
               
            end
           B: 
               begin
                next_state=C;

                   end
              

            C:begin next_state=D;
  
            end
            D: begin
                next_state= in[3] ?           B:A;
      
              
            end
            endcase
        end
    
    
    always@(posedge clk)
        begin
            case(state)
                A: out_bytes[23:16]=in[3] ?  in:0;
                C: out_bytes[7:0]=in;
                D: out_bytes[23:16]=(next_state==A) ? 0:in ;
                B: out_bytes[15:8]=in;
            endcase
        end
    assign done=(state==D);
    

   

endmodule
