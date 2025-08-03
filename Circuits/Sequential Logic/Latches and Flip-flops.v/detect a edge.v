module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
// this required chatgpt help.
    reg [7:0] prev_in;

    always @(posedge clk) begin
        pedge <= ~prev_in & in; // Detect 0→1 transition
        prev_in <= in;          // Store current input for next cycle
    end

endmodule