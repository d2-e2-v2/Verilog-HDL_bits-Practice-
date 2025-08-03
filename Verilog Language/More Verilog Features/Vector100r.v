module top_module( 
    input [99:0] in,
    output  [99:0] out
);
    integer i;
    always@(*)
        begin
            for(i=0;i<99;i=i+1)
                begin
                    out[i]=in[99-i];
                end 
        end
    assign out[0]=in[99];
    assign out[99]=in[0];
    

endmodule
