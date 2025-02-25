module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    int i;
    always @(posedge clk) begin
        q<=0;
        for(i=0;i<16;i++)
            if(reset)
                q<=0;
    		else 
                q<=q+1;
    		
        end
endmodule
