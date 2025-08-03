module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0] q;
   wire [2:0] cas;
    assign  cas[2]=A;
    assign cas[1]=B;
    assign cas[0]=C;
    always@(posedge clk)
           
            begin
                if(enable)
                    begin
                        q[7:0]<=q<<1;
                        q[0]<=S;
                    end
                
            end

    assign Z=q[cas];
    endmodule

