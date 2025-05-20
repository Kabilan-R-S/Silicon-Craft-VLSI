`timescale 1ns / 1ps

module apb_master #(parameter WIDTH = 8,IDLE = 0 ,SETUP = 1 ,ACCESS = 2)(
    input pclk,
    input preset,
    input transfer,
    input rw,
    
    input [WIDTH-1:0]pwaddr_m,
    input [WIDTH-1:0]pwdata_m,
    input [WIDTH-1:0]praddr_m,
    output reg [WIDTH-1:0]data_out,
    
    output reg pwrite,
    input pready,
    output reg psel,
    output reg penable,
    output reg [WIDTH-1:0]paddr_s,
    output reg [WIDTH-1:0]pwdata_s,
    input [WIDTH-1:0]prdata_s,
    
    output reg [1:0] state
    );

    reg [1:0] next ;
    reg [3:0]time_out ;
    
    always @ ( posedge pclk ) begin
        if( preset ) begin
            state <= IDLE ;
            time_out <= 0 ;
        end
        else begin
            state <= next ;
            if( (state == ACCESS) && !pready ) begin
                time_out <= time_out + 1 ;
            end 
            if( time_out == 10 ) begin
                state <= IDLE ;
                time_out <= 0;
            end
        end    
    end
    
    always @(*) begin
        case(state) 
            IDLE   :  next = transfer ? SETUP : IDLE ; 
            SETUP  :  next = ACCESS ;             
            ACCESS :  next = pready ? ( transfer ? SETUP : IDLE ) : ACCESS ;  
            default: next = IDLE ;
        endcase
    end
    
    always @ ( posedge pclk or posedge preset ) begin
        
        if( preset ) begin
            psel     <= 0 ;
            penable  <= 0 ;
            pwrite   <= 0 ;
            paddr_s  <= 0 ;
            pwdata_s <= 0 ;
            data_out <= 0 ;
            time_out <= 0 ;
        end     
        else begin    
            case( state )            
                IDLE : begin
                    psel    <= 0 ;
                    penable <= 0 ;                
                end
                SETUP : begin
                    psel    <= 1  ;
                    penable <= 0  ;
                    pwrite  <= rw ;
                    
                    if( rw ) begin  // write
                        paddr_s  <= pwaddr_m ;
                        pwdata_s <= pwdata_m ;
                    end
                    else begin  // read
                        paddr_s <= praddr_m ;
                    end
                end
                ACCESS : begin
                    psel    <= 1 ;
                    penable <= 1 ;
                    if( !rw ) begin
                        data_out <= prdata_s ;
                    end                    
                end            
            endcase 
        end
    end
    
endmodule
