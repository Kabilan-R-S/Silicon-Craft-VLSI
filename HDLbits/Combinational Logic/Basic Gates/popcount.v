module top_module( 
    input [2:0] in,
    output [1:0] out );
    
   integer i;
    always@(*)
        begin
            out =0;
            for(i=0;i<3;i=i+1)begin
                if(in[i]==1'b1)begin
                    out = out + in [i];
                end
            end
        end

endmodule
