`timescale 1ns / 1ps

module spi_slave  #(parameter DWIDTH = 8)(
        
        input sclk,
        input [1:0]SS_S,
        input [DWIDTH-1:0]somi_data,
        output [DWIDTH-1:0]simo_data,
        input simo,
        output reg somi,
        output reg [DWIDTH:0]bit_cnt_sv = ( DWIDTH - 1 ) 
);
    
    reg [DWIDTH-1:0]shift_reg = 0;
    
    
    always @( posedge sclk ) begin
       
       if(SS_S) begin
            $display( "somi_data = %b", somi_data );
            shift_reg[bit_cnt_sv ] <= simo ;
            somi <= somi_data[bit_cnt_sv];
            bit_cnt_sv <= bit_cnt_sv - 1;
            if(bit_cnt_sv == 0) begin
                bit_cnt_sv <= ( DWIDTH-1 );
            end
       end
    end 
    
    assign simo_data = shift_reg[DWIDTH-1:0] ;
    
endmodule
