module top_module( 
    input [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum );
    
    int i;
    reg c;
    always @(*) begin
        c=cin;
        for(i=0;i<100;i++) begin 
            sum[i]=a[i]^b[i]^c;
            cout[i] =(a[i] & b[i]) | (a[i] & c) | (b[i] & c);
            c=cout[i];
        end
    end
endmodule
