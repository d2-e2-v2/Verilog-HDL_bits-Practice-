module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter LEFT=0, RIGHT=1;
    reg state, next_state;
	wire bumpr,bumpl;
    assign bumpr=bump_right;
    assign bumpl=bump_left;
    always @(*) begin
        case(state)
            LEFT: next_state=( ((bumpl&walk_left) | walk_right&(walk_left))&ground) ? RIGHT:LEFT;
            RIGHT:next_state=(((bumpr&walk_right) | walk_left&(walk_right))&ground) ? LEFT:RIGHT;
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
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            walk_left  <= 1'b1;
            walk_right <= 1'b0;
            aaah       <= 1'b0;
        end else begin
            walk_left  <= (next_state == LEFT)  && ground;
            walk_right <= (next_state == RIGHT) && ground;
            aaah       <= ~ground;
        end
    end

endmodule
