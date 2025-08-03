// A "population count" circuit counts the number of '1's in an input vector. 
//Build a population count circuit for a 255-bit input vector.




////*******   My Code *******/////


module top_module( 
    input [254:0] in,
    output  [7:0] out );
    integer j;
      reg [7:0] out_n;
    always@(*)
          begin
        out_n=0;
      
            for(j=0;j<255;j=j+1)
        begin
            
            out_n= in[j] ? out_n+1: out_n;
                end
        end
      
    assign out=out_n;
    

endmodule

// unnecessarly lengthy code, uses extra hardware.
// BUt hey, atleast it works.



module top_module (
	input [254:0] in,
	output reg [7:0] out
);

	always @(*) begin	// Combinational always block
		out = 0;
		for (int i=0;i<255;i++)
			out = out + in[i];
	end
	
endmodule

// just make the output ereg

