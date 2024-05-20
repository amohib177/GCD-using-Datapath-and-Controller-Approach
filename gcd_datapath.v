`timescale 1ns / 1ps

module gcd_datapath( input wire clk, 
                     input wire clr, 
                     input wire xmsel, 
                     input wire ymsel, 
                     input wire xld, 
                     input wire yld,
                     input wire gld, 
                     input wire [3:0] xin, 
                     input wire [3:0] yin, 
                     output wire [3:0] gcd, 
                     output reg  eqflg=0,
                     output reg  itflg=0  );
                     
                     wire [3:0] xmy,ymx,gcd_out;
                     wire [3:0] x,y,x1,y1;

                    assign xmy = x-y;  
                    assign ymx = y-x;
   
  always @(*)  begin 
                 if(x==y)    
                     eqflg = 1;
                else    
                    eqflg = 0; 
                end
  
  always @(*)  begin 
                if(x < y)    
                   itflg = 1; 
                else     
                   itflg = 0; 
               end
 
   mux2q #( .N(4)) M1 (.a(xmy),    
                       .b(xin),    
                       .s(xmsel),    
                       .y(x1)    ); 
  mux2q #( .N(4)) M2 ( .a(ymx),
                       .b(yin),     
                       .s(ymsel),     
                       .y(y1)    );    
  register #( .N(4)) R1 ( .load(xld),      
                          .clk(clk),      
                          .clr(clr),      
                          .d(x1),      
                          .q(x)   );
 
 register #( .N(4)) R2 ( .load(yld),      
                         .clk(clk),      
                         .clr(clr),      
                         .d(y1),      
                         .q(y)         );        
  register #( .N(4)) R3(  .load(gld),       
                          .clk(clk),   
                          .clr(clr),   
                          .d(x),   
                          .q(gcd_out) );    
  assign gcd = gcd_out; 
endmodule
