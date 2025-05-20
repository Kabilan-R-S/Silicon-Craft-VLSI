`timescale 1ns / 1ps

module spi_testbench #(parameter DWIDTH = 8);
    

        wire SS_M;
        reg reset;
        reg start;
        wire busy;
        wire clk;
        wire [1:0]state;
        wire [DWIDTH:0]bit_cnt_ms;
        reg [DWIDTH-1:0]mosi_data;
        wire mosi;
        wire [DWIDTH-1:0]simo_data;
        wire sclk;
        wire [DWIDTH:0]bit_cnt_sv;
        reg [DWIDTH-1:0]somi_data;
        wire somi;
        wire [DWIDTH-1:0]miso_data;
        
        spi_master uutmaster (
            .reset(reset),
            .start(start),
            .mosi_data(mosi_data),
            .miso_data(miso_data),
            .busy(busy),.sclk(sclk),
            .mosi(mosi),.miso(somi),
            .state(state),.clk(clk),.SS_M(SS_M),
            .bit_cnt_ms(bit_cnt_ms)
        );
        
        spi_slave uutslave (
            .somi_data(somi_data),
            .simo_data(simo_data),
            .simo(mosi),.somi(somi),
            .sclk(sclk),.SS_S(SS_M),
            .bit_cnt_sv(bit_cnt_sv)
        );
        
        initial begin
        
       //   $monitor (" somi = %b miso_data = %b " ,somi , miso_data);
        //  $monitor (" somi = %b " ,somi );
        mosi_data = 8'b1100_0101;
        somi_data = 8'b0101_1010;  
        reset = 1 ;
        #20;
        reset = 0;
        start = 1;
        #20
        start = 0;
        
        #200;
        $finish;
        
        
        
        end
         
    
endmodule
