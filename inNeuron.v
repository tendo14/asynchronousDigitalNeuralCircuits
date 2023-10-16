module inNeuron(
	input sig,
	output reg spk
	);
	
	always@(*)
	begin
		if(sig)
			spk <= 1;
		else
			spk <= 0;
	end
	
endmodule