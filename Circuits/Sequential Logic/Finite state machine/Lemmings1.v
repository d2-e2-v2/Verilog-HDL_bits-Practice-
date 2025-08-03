module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;
	wire bumpr,bumpl;
    assign bumpr=bump_right;
    assign bumpl=bump_left;
    always @(*) begin
        case(state)
            LEFT: next_state<=( (bumpl&walk_left) | walk_right&(walk_left)) ? RIGHT:LEFT;
            RIGHT:next_state<=((bumpr&walk_right) | walk_left&(walk_right)) ? LEFT:RIGHT;
        endcase
        
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
          state<=LEFT;
        else
          state<=next_state;
    end

    // Output logic
            assign walk_left = (state ==LEFT);
    assign walk_right = (state ==RIGHT);

endmodule
