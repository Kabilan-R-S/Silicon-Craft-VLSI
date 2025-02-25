module top_module(
	input ring, 
	input vibrate_mode,
	output ringer,
	output motor
);
	
	assign ringer = ring & ~vibrate_mode;
	assign motor = ring & vibrate_mode;
	
endmodule
//conditions
	// When should motor be on? When (phone is ringing) and (phone is in vibrate mode)
	// When should ringer be on? When (phone is ringing) and (phone is not in vibrate mode)
