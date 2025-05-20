`timescale 1ns / 1ps

module spi_master 
    #(parameter DWIDTH = 8,
                IDLE = 0,
                LOAD = 1,
                TRANSFER = 2,
                DONE = 3)(

        output reg clk = 0,
        input reset,
        input start,
        output [1:0]SS_M,
        input [DWIDTH-1:0]mosi_data,
        output [DWIDTH-1:0]miso_data,
        
        output reg busy,
        output reg sclk,
        output reg mosi,
        input miso,
        output reg [DWIDTH:0]bit_cnt_ms,
        output reg [1:0]state        
    );
    
    reg [DWIDTH:0]shift_reg_tx;
    reg [DWIDTH:0]shift_reg_rx;
    
    reg sclk_en;
    assign SS_M = 1;

always begin
    #10 clk = ~clk;
end

always @(posedge clk ) begin
    if(sclk_en) begin
        sclk <= ~sclk;
        #10 sclk <= ~sclk;
    end
    else
        sclk <= 0;
end

    
    always @(posedge clk) begin
        
        if(reset) begin
            bit_cnt_ms   <= 0;
            state        <= IDLE;
            shift_reg_tx <= 0;
            shift_reg_rx <= 0;
            mosi         <= 0;
            busy         <= 0;
            sclk         <= 0;
            sclk_en      <= 0;
        end
        else begin
            case(state)
                IDLE :  begin
                            busy    <= 0;
                            sclk    <= 0;
                            sclk_en <= 0;
                            if(start & SS_M) begin
                                state <= LOAD;
                            end
                        end
                LOAD : begin
                          shift_reg_tx <= {mosi_data,mosi_data[DWIDTH-1]};
                       //   $display( "shift reg = %b", shift_reg_tx );
                       //   shift_reg_tx[DWIDTH] <= mosi_data[DWIDTH-1];
                          bit_cnt_ms<= ( DWIDTH  );
                          busy      <= 1;
                          sclk_en   <= 1;
                          state     <= TRANSFER;  
                        end
                TRANSFER : begin
                             //   $display( "shift reg = %b", shift_reg_tx );
                                mosi <= shift_reg_tx[bit_cnt_ms];
                                bit_cnt_ms      <= bit_cnt_ms - 1;
                                shift_reg_rx[bit_cnt_ms] <= miso;
                                if(bit_cnt_ms == 0) begin
                                    bit_cnt_ms <= ( DWIDTH  );
                                    sclk_en <= 0;
                                    state   <= DONE;   
                                end
                           end
                DONE : begin
                            busy <= 0;
                            mosi <= 0;
                            sclk <= 0;
                            sclk_en <= 0;
                            state <= IDLE ;
                        end                 
            
            endcase
        end
     end
     
     assign miso_data = shift_reg_rx[DWIDTH-1:0];   
    
endmodule



    
//    always @ (posedge clk or negedge clk) begin
//        if(sclk_en) begin
//            sclk = ~sclk;
//        end
//    end
