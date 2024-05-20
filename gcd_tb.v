`timescale 1ns / 1ps

module gcd_tb ();    
   reg clk,clr,go; 
   reg [3:0] xin,yin; 
  wire [3:0] gcd_out;

gcd U5( .clk(clk),        
        .clr(clr),        
        .go(go),        
       .xin(xin),        
        .yin(yin),        
       .gcd_out(gcd_out)      );      

initial 
 begin  
    clk=1'b0; 
   clr=1'b0; 
   go=1'b0; 
   xin=4'b0000; 
  yin=4'b0000; 
 end
 
 always #10 clk = ~clk;
 
 initial 
       begin  
       #5    clr=1'b0;    
             go=1'b1;    
             xin=4'b0100;    
            yin=4'b1010; 
       end
 
  endmodule
