module top_module( 
    input [99:0] a, b,
    input cin,
    output reg cout,
    output reg [99:0] sum );
    
    reg temp;
    int i;
    
    always @(*) begin
        temp=cin;
        for(i=0;i<100;i=i+1) begin 
            sum[i] = a[i]^b[i]^temp;
            temp =  (a[i]&b[i]) | (temp& a[i]) | (b[i]&temp) ;
            
            
        end
           cout = temp;
    end
  

endmodule
