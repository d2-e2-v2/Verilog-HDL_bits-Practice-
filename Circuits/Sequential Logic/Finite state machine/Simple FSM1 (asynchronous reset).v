module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out
);  
    parameter A=0, B=1; 
    reg state, next_state;

    // State update with async reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= B;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            A: next_state = (in) ? A : B;
            B: next_state = (in) ? B : A;
            default: next_state = B;
        endcase
    end

    // Output logic
    assign out = (state == B);

endmodule
