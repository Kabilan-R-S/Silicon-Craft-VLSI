module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    
    always @(sel) begin
        case(sel)
        	3'b0000 : out = a ;
            3'b0001 : out = b ;
            3'b0010 : out = c ;
            3'b0011 : out = d ;
            3'b0100 : out = e ;
            3'b0101 : out = f ;
            3'b0110 : out = g ;
            3'b0111 : out = h ;
            4'b1000 : out = i ;
            default out = 16'hffff;
                      
        endcase
    end
endmodule
