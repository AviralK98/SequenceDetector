// TEST BENCH FOR Lock_Unlock

`timescale 1ns / 1ps

module tb_Lock_Unlock; // Giving the input output variables

 // Inputs
		reg seq;
		reg clock;
		reg resetphase;

 // Outputs as wire for ModelSim 
		wire det, k, error;
	
// Instantiating the Lock_Unlock Module
 Lock_Unlock uut (
  .seq(seq), 
  .clock(clock), 
  .resetphase(resetphase), 
  .det(det),
  .k(k),
  .error(error)
 );
 //---------------------------------------------------------------------------------
 
 // Initializing the clock and the inputs
 
 initial begin
 clock = 0;
 #10 clock = ~clock; //Clock Initialization, set to forever to obtain longer ModelSim wave signals.
 end 
 
 //-----------------------------------------------------------------------------------
 
 initial begin
  // Initialize Inputs
  seq = 0;
  resetphase = 1;
  
  // Waiting for 140 ns for reset to 
  
  
  #50;
      resetphase = 0;
  #60;seq = 1;#30;seq = 0;#30;seq = 1;#40;seq = 1; #40;
  
  // Another Sequence to Lock it back again
  
  seq = 0; #40;seq = 1;#40;seq = 0;#40;seq = 1; #40;seq = 1; 
  
  
 end
      
endmodule