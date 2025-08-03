
// extremely good question requires good understanding
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] prev_in;
    reg [31:0] hold;
    always@(posedge clk)
        begin
            if(reset)
              begin
                  out<=32'b0;
                  prev_in=in;
              end
            else
                begin    
                        hold=prev_in&~in; // 1->0 detection
                    out= hold | out; // this holds one till reset.
            	prev_in=in;
                end
        
        end
endmodule
