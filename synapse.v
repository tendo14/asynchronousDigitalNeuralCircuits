module synapse(
	input preSpike,
	input [3:0] preDelay,
	input [3:0] postDelay,
	input tWin,
	input reset,
	output [15:0] synOut
	);

	reg [15:0] weight;
	reg [3:0] postreg;
	reg [3:0] prereg;
	reg [15:0] delW;

	always@(tWin)
	begin
		postreg <= postDelay;
		prereg <= preDelay;
	end

	always@(*)
	begin
		if(postreg < prereg)
			weight = weight + delW;
		else
			weight = weight - delW;
	end

	always@(negedge reset)
	begin
		weight <= 0;
		delW <= 12;	
	end

	assign synOut = preSpike?weight:0;
	
endmodule	
