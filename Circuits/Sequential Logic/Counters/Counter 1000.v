module top_module (
    input clk,
    input reset,
    output reg OneHertz,
    output [2:0] c_enable
); 
    wire [3:0] count0, count1, count2;
    reg [2:0] enable;

    assign c_enable = enable;

    
    always @(*) begin
        enable[0] = 1;                         // Always enable counter0
        enable[1] = (count0 == 4'd9);          // Enable counter1 when counter0 is 9 
        enable[2] = (count0 == 4'd9 && count1 == 4'd9); // Enable counter2 when both counters are 9
    end

    // OneHertz generation
    always @(*) begin
        if (reset)
            OneHertz <= 0;
        else if (count0 == 4'd9 && count1 == 4'd9 && count2 == 4'd9)
            OneHertz <= 1;
        else
            OneHertz <= 0;
    end

    // Counters
    bcdcount counter0 (clk, reset,enable[0], count0);
    bcdcount counter1 (clk, reset,enable[1], count1);
    bcdcount counter2 (clk, reset,enable[2], count2);
endmodule
