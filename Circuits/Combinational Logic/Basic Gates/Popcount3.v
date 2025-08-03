module top_module( 
    input [2:0] in,
    output reg  [1:0] out );
    integer i;
    always@(*)
        begin
            out=0;
            for(i=0;i<$bits(in);i++)
                out= in[i] + out;
        end
    

endmodule
