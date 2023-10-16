module paraRom #(parameter DEPTH = 8)(
	input [2:0] address,
	input rst,
	input readEn,
	output reg [15:0] dataOut
);

reg [15:0] romMem [0:DEPTH-1];

always@(*)
begin
	if(rst)
		begin
		romMem[0] = 16'h0;	romMem[1] = 16'h0;	romMem[2] = 16'h0;	romMem[3] = 16'h0;
		romMem[4] = 16'h0; 	romMem[5] = 16'h0;	romMem[6] = 16'h0;	romMem[7] = 16'h0;
		end
	else if(readEn)
		dataOut = romMem[address];
	else
		dataOut = 16'hFFFF;
end
endmodule



