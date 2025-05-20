module updown(
    input clk,
    input up,
    input down,
    input reset,
    output reg [3:0]count
);

    always @(posedge clk or posedge reset) begin
        if(reset) begin
            count = 0 ;
        end
        else if (up) begin
            count = count + 1;
        end
        else if (down) begin
            count = count - 1;
        end
    
    end
endmodule
