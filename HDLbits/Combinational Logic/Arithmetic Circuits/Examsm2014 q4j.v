module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire w1,w2,w3,w4;
    full f1(.a(x[0]),.b(y[0]),.c(1'b0),.sum(sum[0]),.cout(w1)   );
    full f2(.a(x[1]),.b(y[1]),.c(w1),.sum(sum[1]),.cout(w2)   );
    full f3(.a(x[2]),.b(y[2]),.c(w2),.sum(sum[2]),.cout(w3)   );
    full f4(.a(x[3]),.b(y[3]),.c(w3),.sum(sum[3]),.cout(sum[4])   );
   // full f5(.a(x[0]),.b(y[0]),.c(w4),.sum(sum[4])  );
    

endmodule


module full(
	input a,b,c,
    output sum,cout
);
   	assign sum = a^b^c;
    assign cout =(a&b)|(b&c)|(a&c);
   
endmodule
