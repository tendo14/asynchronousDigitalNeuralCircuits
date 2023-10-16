module neuron4 #(parameter DELAY = 12)(
	input [15:0] inspk1,
	input [15:0] inspk2,
	input [15:0] inspk3,
	input [15:0] inspk4,
	input clk,
	input reset,
	output reg spike,
	output [3:0] outDelay
	);

	reg addStore;
	integer i;
	reg spikeReg;
	reg [3:0] cnt;
	
	always@(negedge reset)	//reset
	begin
		cnt <= 0;
	end

	always@(clk)	//count
	begin
		cnt <= cnt + 1;
		if(cnt >= 16)
			cnt <= 0;
	end

	always@(*)	//adder
	begin
		addStore <= inspk1 + inspk2 + inspk3 + inspk4;
	end

	always@(*)	//comparator
	begin
		if(addStore > 36)
			spikeReg <= 1;
		else
			spikeReg <= 0;
	end

	always@(*)	//spike output
	begin
		if(cnt == DELAY)
			spike <= spikeReg;
	end





endmodule
