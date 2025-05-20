`timescale 1ns / 1ps

module uart_rx #( 
       parameter DATA_IDLE  = 0,
        DATA_START = 1,
        DATA_BIT   = 2,
        DATA_STOP  = 3,
        BAUD_RATE = 9600,
        CLOCK_FREQ = 10,
        CLOCKS_PER_BIT = 10 )
  (
        input rx_serial_data,
        output [7:0]rx_parallel_data,
        output rx_done,
        output reg rx_clk,
        output reg [2:0]bit_index,
        output reg [2:0]rx_state = DATA_IDLE
    );
    
    initial begin
        rx_clk = 0;
        forever #CLOCK_FREQ rx_clk = ~rx_clk ;
    end
    
    reg sync_1 = 1;
    reg sync_2 = 1;
    
    reg [7:0]clk_count ;
    reg [7:0]data_buffer ;
    reg flag ;
    
    always @( posedge rx_clk ) begin
        sync_1 <= rx_serial_data;
        sync_2 <= sync_1;
        $monitor ( "data_buffer %b " , data_buffer);
    end
    
//    reg [2:0]rx_state = DATA_IDLE;
    
    always @( posedge rx_clk ) begin
        case(rx_state)
            DATA_IDLE : begin
                clk_count <= 0 ;
                bit_index <= 7 ;
                flag <= 0 ;
                if( sync_2 == 0 ) begin  // 0 -> start bit
                    data_buffer <= 0 ;
                    rx_state    <= DATA_START;
                end
                else begin
                    rx_state <= DATA_IDLE;
                end
            end
            DATA_START : begin
                if ( clk_count == (CLOCKS_PER_BIT - 1)/2 ) begin
                    if(sync_2 == 0 ) begin
                        clk_count <= 0;
                        rx_state <= DATA_BIT;
                    end
                    else begin
                        rx_state <= DATA_IDLE;
                    end
                end
                else begin
                    clk_count <= clk_count + 1 ;
                end    
            end
            DATA_BIT : begin
                 if ( clk_count < (CLOCKS_PER_BIT - 1) ) begin
                    clk_count <= clk_count + 1;
                 end
                 else begin
                    data_buffer[bit_index] <= sync_2;
                    clk_count <= 0;
                    if(bit_index != 0) begin
                        bit_index <= bit_index - 1;
                        rx_state <= DATA_BIT; 
                    end
                    else begin
                        bit_index <= 7 ;
                        rx_state <= DATA_STOP ;
                    end
                 end
            end
            DATA_STOP : begin
                if( sync_2 == 1 ) begin
                    flag <= 1;
                    clk_count <= 0;
                    rx_state <= DATA_IDLE ;
                end    
            end
            default : rx_state <= DATA_IDLE ;          
        endcase
    end   
    
    assign rx_done = flag ;
    assign rx_parallel_data = data_buffer;
    
endmodule
