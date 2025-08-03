module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output  fr3,
    output  fr2,
    output  fr1,
    output  dfr
); 
    reg [2:0] prev_state,out,age;
    reg ndfr;
    parameter A=0,B=1,C=3,D=7;
    wire helpme,helpme1,helpme2;

    
    always@(posedge clk) // output based on current and last state
        begin
            if(!reset)
                begin
            case(s[3:1])
                A:out=0;
                B: out= (prev_state>s)?  2: (prev_state==s) ? 7:1;
                C: out=(prev_state>s) ? 4: (prev_state==s) ? 6:3 ;
                D: out= 5;
                default: out=0;
            endcase
                end
            else
                begin
                    out=0;
                end
        end
        
      assign fr3=(out==0);
    assign fr2=(out==1 | out==2 |out==7| out==0);
    assign fr1=(out==1 | out==2 | out==0 | out==7 | out==6 | out==4 | out==3);
    assign dfr=( (out==2 | out==4| out==0) || ((out==7 |out==6)&ndfr) );

    always@(posedge clk)// tranisition logic
        begin
            if(reset)
                begin
    prev_state<=A;
            ndfr=1;
                end
            else
                begin
                prev_state<=s[3:1];
            ndfr=dfr;
                end
        end

endmodule