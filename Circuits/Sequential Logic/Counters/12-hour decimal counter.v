module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
); 
// learn about functions to get the best of this question
    function [7:0] bcd_increment;
        input [7:0] bcd_no;
        begin
            if (bcd_no[3:0] == 4'd9)
                bcd_increment = {bcd_no[7:4] + 4'd1, 4'd0};
            else
                bcd_increment = bcd_no + 8'd1;
        end
    endfunction

    always @(posedge clk) begin
        if (reset) begin
            pm <= 0;
            hh <= 8'h12; // BCD 12
            mm <= 8'h00;
            ss <= 8'h00;
        end
        // this code segement can get some well needed optimization
        else if (ena) begin
            if (ss == 8'h59) begin
                ss <= 8'h00;
                if (mm == 8'h59) begin
                    mm <= 8'h00;
                    if (hh == 8'h11) begin
                        hh <= bcd_increment(hh);
                        pm <= ~pm;
                    end
                    else if (hh == 8'h12) begin
                        hh <= 8'h01;
                    end
                    else begin
                        hh <= bcd_increment(hh);
                    end
                end
                else begin
                    mm <= bcd_increment(mm);
                end
            end
            else begin
                ss <= bcd_increment(ss);
            end
        end
    end

endmodule
