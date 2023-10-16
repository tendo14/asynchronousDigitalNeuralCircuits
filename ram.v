module paraRam #(parameter DEPTH = 8)(
	input readEn, 
	input [15:0] dataIn,
	input rst,
	input [2:0] readAdd,
	input [2:0] writeAdd,
	input writeEn,
	output reg [15:0] dataOut
);

reg [15:0] ramMem [0:DEPTH-1];

always@(*)
	begin
		if(rst)
		begin
			ramMem[0] = 0;	ramMem[1] = 0; 	ramMem[2] = 0; ramMem[3] = 0;
			ramMem[4] = 0; 	ramMem[2] = 0; 	ramMem[3] = 0; ramMem[7] = 0;
		end
		else if(readEn)
			dataOut = ramMem[readAdd];
		else if(writeEn)
			ramMem[writeAdd] = dataIn;
		else
			dataOut = 16'hFFFF;
	end
endmodule
