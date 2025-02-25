// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;
    
    
    parameter A=0, B=1; 
    reg [1:0]state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            B:next_state = (in==1'b0)? A : B;
            A:next_state = (in==1'b0)? B : A;
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        
        if(reset)
            state<=B;
        else
            state<=next_state;
    end

    // Output logic
             assign out = (state == B);

endmodule
