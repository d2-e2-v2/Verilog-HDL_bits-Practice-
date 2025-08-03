module top_module(
    input clk,
    input reset,          // Synchronous, active-high
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);
// solved with chatgpt help ////

    reg [3:0] next_d;
    reg load, en;

    // Internal wire to hold current output of count4
    wire [3:0] count4_out;

    // Control logic
    assign c_load = load;
    assign c_enable = en;
    assign c_d = next_d;
    assign Q = count4_out;

    always @(*) begin
        if (reset) begin
            load = 1;
            en = 0;
            next_d = 4'd1;      // Reset loads 1
        end else if (count4_out == 4'd12 && enable) begin
            load = 1;
            en = 0;
            next_d = 4'd1;      // Wrap back to 1 after 12
        end else if (enable) begin
            load = 0;
            en = 1;
            next_d = 4'd0;      // Not used when load=0
        end else begin
            load = 0;
            en = 0;
            next_d = 4'd0;      // Hold state
        end
    end

    // Instantiate the given count4 module
    count4 my_counter (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(count4_out)
    );

endmodule
