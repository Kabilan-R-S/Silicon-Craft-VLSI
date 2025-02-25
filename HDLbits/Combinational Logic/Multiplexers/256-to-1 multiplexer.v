module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output reg out );
    
    always @(sel) out = in[sel*1];

endmodule
