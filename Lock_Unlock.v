module Lock_Unlock(seq,clock,resetphase,det,error,k
    );

	 //Module Initialization
	 
	input clock; // clocking signal

	input resetphase; // reset phase

	input seq; // binary input

	output reg det; // to detect the output sequence

	output reg error; // output of the sequence detector

	reg [2:0] cs; // Current State of the machine

	reg [2:0] ns; // Next State of the machine

	localparam UNLOCKED = 2'b00, LOCKED = 2'b01; // Local Parameter to get the state
	
	output reg [2:0] k; // To store the state of the machine(Locked or Unlocked)
	
	localparam  Zero=3'b000, // "Zero" State
					OS=3'b001, // "One" State
					OZS=3'b011, // "OneZero" State
					OZOS=3'b010, // "OnceZeroOne" State
					OZOOS=3'b110;// "OneZeroOneOne" State
					
   // Module Initialization completed
	

	
// Proceeding with Moore Lgoic and determining the state

always @(posedge clock, posedge resetphase)

begin
 
 if(resetphase==1) begin
		cs <= Zero; k=LOCKED; // when resetphase=1, reset the state of the FSM to "Zero" State, Locked state
		end 
 else begin
		cs <= ns; k=UNLOCKED; // else go to next state, Unlocked state
		end 
end 
//--------------------------------------------------------------------------------------------------------------	


// Moore Finite State Machine to determine next state 

/* This part of the code is implementing
	the Moore Logic to determine the 
	next state of the system, using binary
	values '1011' as the keypress pattern */


always @(cs,seq)
begin 
 case(cs) 
 Zero:begin   // Starting with the Zero state.
  if(seq==1) // If the input value is matching the bit, it will be set into 'One' state else set to 'Zero' state.
   ns = OS;
  else
   ns = Zero; 
 end
 OS:begin    // For the 'One' State (1)
  if(seq==0)
   ns = OZS;
  else
   ns = OS;
 end
 OZS:begin  // For the 'One Zero' State (10)
  if(seq==0)
   ns = Zero;
  else
   ns = OZOS;
 end 
 OZOS:begin // For the 'One Zero One' State (101)
  if(seq==0)
   ns = OZS;
  else
   ns = OZOOS;
 end
 OZOOS:begin // For the 'One Zero One One' State (1011)
  if(seq==0)
   ns = OZS;
  else
   ns = OS;
 end
 default:ns = Zero; // The default state will be set to 'Zero'
 endcase
end
//------------------------------------------------------------------------------
			
			
	/* Logic to obtain the output for Moore Finite State Machine 
		Output is dependent upon the Current State */

		always @(cs)
		begin 
		case(cs) // Implementing the Moore Logic
				Zero:   det = 0;
				OS:   det = 0;
				OZS:  det = 0;
				OZOS:  det = 0;
				OZOOS:  det = 1;
				default:  det = 0;
				endcase
//-------------------------------------------------------------------------------				
	
	
	// To check for error
	
		if (det) begin 
		
			error=1'b0; 
			
		end
		
		else begin  
		
		/*If 'det' is 0 it means that, the sequence was 
		not right and the output(error) is flagged high(1'b1) */
		
			error=1'b1;
			
		end
		end

endmodule
	