`timescale 1ns / 1ps


module apb_tb #(parameter WIDTH = 8);
    
    reg pclk    ;
    reg preset  ;
    reg transfer;
    reg rw      ;
    
    wire psel   ;
    wire penable; 
    wire pready ;
    
    reg [WIDTH-1:0]pwaddr_m ;
    reg [WIDTH-1:0]pwdata_m ;
    reg [WIDTH-1:0]praddr_m ;
    wire [WIDTH-1:0]data_out;

    wire [WIDTH-1:0]paddr_s ;
    wire [WIDTH-1:0]pwdata_s;
    
    wire [1:0] state ;
   
    wire [WIDTH-1:0]prdata;
    
    initial begin
        pclk= 0 ;
        forever #5 pclk = ~pclk ;
    end
    
    apb_master dut (
        .pclk       (pclk),
        .preset     (preset),
        .transfer   (transfer),
        .rw         (rw),

        .pwaddr_m   (pwaddr_m) ,
        .pwdata_m   (pwdata_m) ,
        .praddr_m   (praddr_m) ,
        .data_out   (data_out) ,

        .pwrite     (pwrite)   ,
        .pready     (pready)   ,
        .psel       (psel)     ,
        .penable    (penable)  ,
        .paddr_s    (paddr_s)  ,
        .pwdata_s   (pwdata_s) ,
        .prdata_s   (prdata)   ,
        .state      (state   )
    );
    
    apb_slave uut (
        .pclk     (pclk)      ,
        .preset   (preset)    ,
        .pwrite   (rw    )    ,
        .pready   (pready)    ,
        .psel     (psel)      ,
        .penable  (penable)   ,
        .paddr    (paddr_s)   ,
        .pwdata   (pwdata_s)  ,
        .prdata   (prdata)
    );
    
    initial begin
        
        preset = 1   ; 
        transfer = 1 ;
        rw = 1       ;
        
        #10;
        
        preset = 0;
        @( posedge pclk );
         
        pwaddr_m = 8'h5 ;  pwdata_m  = 8'h5 ; #40;
        pwaddr_m = 8'h6 ;  pwdata_m  = 8'h6 ; #20;
        pwaddr_m = 8'h7 ;  pwdata_m  = 8'h7 ; #30;
        transfer = 0    ; pwaddr_m = 8'h0   ; pwdata_m  = 8'h0 ; #10;                                            
        rw = 0 ; transfer = 1 ; praddr_m = 8'h5 ;  #20;
        rw = 0 ; transfer = 1 ; praddr_m = 8'h6 ;  #20;
        rw = 0 ; transfer = 1 ; praddr_m = 8'h7 ;  #20;
        #100;
        $finish;
    end 
     
endmodule





