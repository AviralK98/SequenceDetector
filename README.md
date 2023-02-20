# Sequence Detector:- State Machine Based Digital Lock 



# 										STATE MACHINE

1) State machine is simply a model that governs how a particular system will behave. It can only have two 
states that it has already been set-up  with.  

2) The state machine used in this code is based on the Moore Law of operating a finite state machine.


#                                 PARTS OF THE DIGITAL LOCK

The code consists of two main verilog vhdl files files nmaely, Lock_Unlock and a test bench tb_Lock_Unlock.
The first file is the where the operating code is written and the second one is a test bench to test and
give the inputs to the Lock_Unlock module so that we can implement the Moore based Finite State Machine.

#                                 OUTPUT
  
1) STATE TABLE
 ![statetable](https://user-images.githubusercontent.com/99490543/158156056-4582f6a6-3e98-4a7c-9e5e-7a21ce0f8b32.png)

2) STATE MACHINE 
![sf1](https://user-images.githubusercontent.com/99490543/158156213-ce155d13-05c4-4fd7-92c8-d2ec46a5d36f.png)

3) WAVEFORMS
![waveform](https://user-images.githubusercontent.com/99490543/158156536-31e92dc0-bc75-4a78-9c53-9bffb518537d.png)
![updated_waveform](https://user-images.githubusercontent.com/99490543/158156568-60157052-c64e-4e7c-b424-819b2845b32b.png)
