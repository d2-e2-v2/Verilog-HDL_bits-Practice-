/// unsolved  yet /// 

// Currently working code///
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output [15:0] q);
    wire inc3,inc2,inc1,inc0;
    always@(*)
        begin
            ena[3:1]<={inc2,inc1,inc0};
        end// define increment for each counter
    bcd_base k1 (.clk(clk),.cin(0),.inc(inc0),.reset(reset),.q(q[3:0]));
    bcd k2(.clk(clk),.cin(inc0),.reset(reset),.q(q[7:4]),.inc(inc1)) ;
    bcd k3(.clk(clk),.cin(inc1),.reset(reset),.q(q[11:8]),.inc(inc2) );
    bcd k4(.clk(clk),.cin(inc2),.reset(reset),.q(q[15:12]),.inc(inc3) );

endmodule
module bcd_base(
    input clk,
    input cin,
    input reset, 
    output inc, 
    output [3:0] q);
    always@(posedge clk)
        begin
            if(reset)
                begin
                q=3'b000;
              
                end
            else if(q[3]&q[0] & !cin)
                begin
                    q=0;
                end
           else
               begin
               q=q+1'b1;
                 
                   
               end
        end
    always@(*)
             begin
                 inc= reset ? 0: (q[3]&q[0]) ? 1:0;
             end
        

endmodule

     module bcd (
    input clk,
    input cin,
    input reset, 
   
    output inc,
    
    output reg [3:0] q);
         
         
         always@(posedge clk)
             begin
                 if(reset)
                     begin
                      
                    
                         q=0;
                     end
                 else if(q[3]&q[0])
                     begin
                         if(cin)
                             begin
                                 q=0;
                              
                             end
                     end
                     else
                         begin
                     q= q+cin;
                 	
                         end
             end
         always@(*)
             begin
                 inc= reset ? 0: (q[3]&q[0]&cin) ? 1:0;
             end
        
     
endmodule  