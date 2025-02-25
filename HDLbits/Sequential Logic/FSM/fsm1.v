module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            B:next_state = (in==1'b0)? A : B;
            A:next_state = (in==1'b0)? B : A;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        
        if(areset)
            state<=B;
        else
            state<=next_state;
    end

    // Output logic
             assign out = (state == B);

endmodule
