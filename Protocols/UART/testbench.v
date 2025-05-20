`include "RX.sv"
`include "TX.sv"

module uart_testbench;
    
        wire tx_clk;
        wire rx_clk;
        reg start;
        wire busy;
        reg [7:0]tx_parallel_data; 
        wire serial_data;
        wire [7:0]rx_parallel_data;
        wire tx_done;
        wire rx_done;
        

        uart_tx uuttx (
            .start(start),
            .tx_parallel_data(tx_parallel_data),
            .serial_data(serial_data),
            .busy(busy),
            .tx_done(tx_done),
            .tx_clk(tx_clk)
        ); 
        
        uart_rx uutrx (
            .rx_serial_data(serial_data),
            .rx_parallel_data(rx_parallel_data),
            .rx_done(rx_done),
            .rx_clk(rx_clk)
        );
        
        
        initial begin
            
            start = 1 ; tx_parallel_data = 8'b10101010 ;
            #200;
            start = 0;
            #1600;
            $finish;
            
        end
  		
  		initial begin
          $dumpfile("dump.vcd");
          $dumpvars;
        end  		
    
endmodule
