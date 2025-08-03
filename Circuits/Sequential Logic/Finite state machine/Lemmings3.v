module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah,
    output reg digging
); 

    // Define states
    localparam LEFT   = 3'd0,
               RIGHT  = 3'd1,
               FALL_L = 3'd2,
               FALL_R = 3'd3,
               DIG_L  = 3'd4,
               DIG_R  = 3'd5;

    reg [2:0] state, next_state;

    // State update
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            LEFT: begin
                if (!ground)
                    next_state = FALL_L;
                else if (dig)
                    next_state = DIG_L;
                else if (bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end

            RIGHT: begin
                if (!ground)
                    next_state = FALL_R;
                else if (dig)
                    next_state = DIG_R;
                else if (bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end

            FALL_L:  next_state = ground ? LEFT  : FALL_L;
            FALL_R:  next_state = ground ? RIGHT : FALL_R;
            DIG_L:   next_state = ground ? DIG_L : FALL_L;
            DIG_R:   next_state = ground ? DIG_R : FALL_R;

            default: next_state = LEFT;
        endcase
    end

    // Output logic
    always @(*) begin
        walk_left  = (state == LEFT);
        walk_right = (state == RIGHT);
        aaah       = (state == FALL_L) || (state == FALL_R);
        digging    = (state == DIG_L) || (state == DIG_R);
    end

endmodule
