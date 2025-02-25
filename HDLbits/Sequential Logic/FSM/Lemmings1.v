module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

     parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        case(state)
            LEFT:next_state=(bump_left==1'b1)?RIGHT:LEFT; //condition for the left bump and that should be true to both left and right
            RIGHT:next_state=(bump_right==1'b1)?LEFT:RIGHT;//condition for the right bump and that should be true to both left and right
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=LEFT;
        else
            state<=next_state;
    end

    
    assign walk_left = (state == LEFT );
    assign walk_right = (state == RIGHT );

endmodule
