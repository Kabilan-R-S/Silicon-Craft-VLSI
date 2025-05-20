`timescale 1ns / 1ps

module uart_tx #(
        parameter DATA_IDLE  = 0,
         DATA_START = 1,
         DATA_BIT   = 2,
         DATA_STOP  = 3,
         BAUD_RATE = 9600,
         CLOCK_FREQ = 5,
         CLOCKS_PER_BIT = 20 )   // ((CLOCK_FREQ)/BAUD_RATE)
      (
        input start,
        input [7:0]tx_parallel_data,
        output reg serial_data,
        output busy,
        output tx_done,
        output reg tx_clk,
        output reg [2:0]tx_state = DATA_IDLE,
        output reg [2:0]bit_index 
    ); 
    
    initial begin
        tx_clk = 0;
        forever #CLOCK_FREQ tx_clk = ~tx_clk ;
    end 
    
    reg [7:0]clk_count ;
    reg [7:0]data_buffer ;
    reg flag ;
    reg active ;
    
    always @( posedge tx_clk ) begin
       
        case(tx_state)
            
            DATA_IDLE : begin
                serial_data <= 1'b1 ;
                flag        <= 1'b0 ;
                clk_count   <= 1'b0 ;
                bit_index   <= 3'd7 ;
                
                if(start == 1) begin
                    active      <= 1'b1 ;
                    data_buffer <= tx_parallel_data ;                    
                    tx_state       <= DATA_START ;
                end
                else begin
                    tx_state <= DATA_IDLE ;
                end                
            end
            
            DATA_START : begin
                serial_data <= 1'b0;
                if( clk_count < CLOCKS_PER_BIT - 1) begin
                    clk_count <= clk_count + 1;
                    tx_state <= DATA_START ;                    
                end
                else begin
                    clk_count <= 0;
                    tx_state <= DATA_BIT;
                end              
            end
            
            DATA_BIT : begin
            
                serial_data <= data_buffer[bit_index];
                if( clk_count < CLOCKS_PER_BIT - 1 ) begin
                    clk_count <= clk_count + 1 ;
                end
                else begin 
                    clk_count <= 0 ;    
                    if ( bit_index != 0 ) begin
                        bit_index <= bit_index - 1 ;
                        tx_state <= DATA_BIT ;
                    end
                    else begin
                        bit_index <= 7 ;
                        clk_count <= 0 ;    
                        tx_state <= DATA_STOP ;
                    end
                end
                
            end
            
            DATA_STOP : begin

                serial_data  <= 1'b1 ;
                flag         <= 1 ;
                active       <= 0 ;
                 
                if( clk_count < CLOCKS_PER_BIT - 1 ) begin
                    clk_count <= clk_count + 1 ;
                end
                else begin
                     clk_count <= 0 ;
                     tx_state     <= DATA_IDLE ;                                            
                end                                
            end            
            default : tx_state <= DATA_IDLE ;
        endcase
          
    end
    
    assign busy = active ;
    assign tx_done = flag ;
    
endmodule
