`timescale 1ns / 1ps

module gcd( input wire clk,  
            input wire clr, 
            input wire go,  
            input wire [3:0] xin, 
            input wire [3:0] yin,  output wire [3:0] gcd_out  );    
            wire eqflg,itflg,xmsel,ymsel; 
            wire xld,yld,gld;   
 
  gcd_datapath U1 (  .clk(clk),  
                    .clr(clr),  
                    .xmsel(xmsel), 
                    .ymsel(ymsel),  
                    .xld(xld),  
                    .yld(yld),  
                    .gld(gld),  
                    .xin(xin),  
                    .yin(yin),  
                    .gcd(gcd_out), 
                    .eqflg(eqflg),  
                    .itflg(itflg) );
 gcd_control U2( .clk(clk),  
                 .clr(clr),
                 .go(go),  
                 .eqflg(eqflg), 
                 .itflg(itflg),  
                 .xmsel(xmsel),  
                 .ymsel(ymsel),  
                 .xld(xld),  
                 .yld(yld),  
                 .gld(gld) );    
endmodule
