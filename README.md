Initial approach: 
  
based on the Euclidian algorithm we can write pseudo code as 

     module gcd ( input wire [3:0] x,        
                  input wire [3:0] y,       
                  output reg [3:0] gcd ); 
             
         reg [3:0] xs, ys; 
 
      always @(*) begin 
           xs = x  ;
           ys = y  ;
           while ( xs!= ys)
           begin 
                 if(xs<ys)     
                     y = ys - xs ; 
                 else      
                     x = xs - ys ;
           end       
           gcd = xs;
           end
           endmodule 
 
this pseudo code gives correct results, but it is still not synthesizable because using a while loop can not be synthesized. 
 
so therefore we can divide pseudo code into two parts 1. Combinational Logic 2. Sequential Logic 
 
so the first part is used as a datapath and the second part is used as the controller 
 
1. Datapath :       From pseudo code, first, we need three registers. the first register is for the first number input. the second register is for the second number input. and the third register is to store and give the greatest common divisor. After that register is connected to equal, subtraction, and greater than block. Finally, that subtraction goes into input using a Multiplexer. and two status flags are generated using that final block. and select line of Multiplexer, clock, clear, the load is controlled using the controller block  

   ![image](https://github.com/amohib177/GCD-using-Datapath-and-Controller-Approach/assets/125816552/9962cba4-1de3-41ac-8eda-c2653190962a)

3. Controller:     Control path is made by FSM(Finite State Machine). It consists of 7 states. initial state is 'start'. then based on the 'go' signal, the next state can be decided. if the 'go' signal is high then only it can go to the 'input' state. than as input x and y are loaded to register. next state 'test1' is decided. Now based on the status flag 'eqflg', if eqflg is high ( x equal to y ) then it goes to the 'done' state, else it goes to 'test2' state. now as based on  'itflg' status signal, if it is high then it goes to 'update1' state otherwise it goes to 'update2' state. which further goes to 'test' state. now for 'clr' status 
signal, next state is determined. if 'clk' status signal is high then next state is 'start',else it is remains on same state  

    ![image](https://github.com/amohib177/GCD-using-Datapath-and-Controller-Approach/assets/125816552/a60dfac9-38cd-4061-a1a6-137c62e6be46)

Now by combining both datapath and control path in topmodule we get synthesizable hardware. 
 
