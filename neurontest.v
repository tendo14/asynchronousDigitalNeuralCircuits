`timescale 1ns/1ps

'include "network.v"

module neurontest();

	reg clk, reset;

	network tb(.clk(clk), .reset(reset));
	
	initial
	begin
		reset <= 0;
		#2;
		reset <= 1;
		clk <= 0;
	end
	
	initial
	begin
		repeat (10)
		#5 clk <= ~clk;
	end
	
endmodule
