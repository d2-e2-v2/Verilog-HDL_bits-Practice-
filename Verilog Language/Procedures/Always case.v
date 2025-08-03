module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
        000: out=data0;
        001: out=data1;
        010: out=data2;
        011 :out=data3;
        100 :out=data4;
        101 :out=data5
    default:out=4'b0000;
        endcase
    end

endmodule