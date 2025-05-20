`timescale 1ns / 1ps

module apb_slave #(parameter WIDTH = 8)(
        input pclk,
        input preset,
        input pwrite ,
        output reg pready ,
        input psel,
        input penable,
        
        input [WIDTH-1:0]paddr,
        input [WIDTH-1:0]pwdata,
        output reg [WIDTH-1:0]prdata
    );
    
    reg [WIDTH-1:0] memory [7:0];
    
    always @ ( posedge pclk or posedge preset ) begin
        $monitor( " memory = %p " , memory );
        if ( preset ) begin
            prdata <= 0 ;
            pready <= 0 ;
        end
        else begin
            if ( psel & penable ) begin
                pready <= 1 ;
                if( pwrite ) begin
                    memory[paddr] <= pwdata ;
                end
                else begin
                    prdata <= memory[paddr] ;
                end
            end
            else begin
                pready <= 0 ;
            end
        end
    end
    
endmodule
