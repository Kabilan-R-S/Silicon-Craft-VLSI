module top_module (
    input clk,
    input d,
    output q
);
    reg q1,q2;
    always@(posedge clk)
        q1<=d;
    always@(negedge clk)
        begin q2<=d;
        end
    assign q = clk? q1:q2;

endmodule
