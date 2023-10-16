'include "neuron3.v"
'include "neuron4.v"
'include "inNeuron.v"
'include "synapse.v"

module network(
	input clk,
	input reset
	);

	reg tWin;

		wire insig1, insig2, insig3;
		
		wire [3:0] delayin1, delayin2, delayin3;
		wire inspk11, inspk12, inspk13, inspk14;
		wire inspk21, inspk22, inspk23, inspk24;
		wire inspk31, inspk32, inspk33, inspk34;
		wire [15:0] inSynOut11, inSynOut12, inSynOut13, inSynOut14;
		wire [15:0] inSynOut21, inSynOut22, inSynOut23, inSynOut24;
		wire [15:0] inSynOut31, inSynOut32, inSynOut33, inSynOut34;
		
		wire inpspk1, inpspk2, inpspk3;
		wire spk1, spk2, spk3, spk4;
		
		wire [3:0] delayhid1, delayhid2, delayhid3, delayhid4;
		wire hidspk11, hidspk12, hidspk13;
		wire hidspk21, hidspk22, hidspk23;
		wire hidspk31, hidspk32, hidspk33;
		wire hidspk41, hidspk42, hidspk43;
		wire [15:0] hidSynOut11, hidSynOut12, hidSynOut13;
		wire [15:0] hidSynOut21, hidSynOut22, hidSynOut23;
		wire [15:0] hidSynOut31, hidSynOut32, hidSynOut33;
		wire [15:0] hidSynOut41, hidSynOut42, hidSynOut43;

		wire outspk1, outspk2, outspk3;	
		wire [3:0] delayout1, delayout2, delayout3;

		
		assign insig1 = 1'b1;
		assign insig2 = 1'b1;
		assign insig3 = 1'b1;
		
		assign inpspk1 = inspk11;
		assign inpspk1 = inspk12;
		assign inpspk1 = inspk13;
		
		assign inpspk2 = inspk21;
		assign inpspk2 = inspk22;
		assign inpspk2 = inspk23;
		
		assign inpspk3 = inspk31;
		assign inpspk3 = inspk32;
		assign inpspk3 = inspk33;
		
		assign spk1 = hidspk11;
		assign spk1 = hidspk12;
		assign spk1 = hidspk13;
		
		assign spk2 = hidspk21;
		assign spk2 = hidspk22;
		assign spk2 = hidspk23;
		
		assign spk3 = hidspk31;
		assign spk3 = hidspk32;
		assign spk3 = hidspk33;
		
		assign spk4 = hidspk41;
		assign spk4 = hidspk42;
		assign spk4 = hidspk43;
				
	always@(negedge reset)
		tWin <= 0;


	always@(clk)
		tWin <= ~tWin;
	
	//input layer neurons and synapses

		//neuron 1
		inNeuron inN1(insig1, inpspk1);
		//neuron 2
		inNeuron inN2(insig2, inpspk2);
		//neuron 3 
		inNeuron inN3(insig3, inpspk1);
		
		//synapse 11, synapse 12, synapse 13, synapse 14
		synapse in11(.preSpike(inspk11), .preDelay(delayin1), .postDelay(delayhid1), .tWin(tWin), .reset(reset), .synOut(inSynOut11));
		synapse in12(.preSpike(inspk12), .preDelay(delayin1), .postDelay(delayhid2), .tWin(tWin), .reset(reset), .synOut(inSynOut12));
		synapse in13(.preSpike(inspk13), .preDelay(delayin1), .postDelay(delayhid3), .tWin(tWin), .reset(reset), .synOut(inSynOut13));
		synapse in14(.preSpike(inspk14), .preDelay(delayin1), .postDelay(delayhid4), .tWin(tWin), .reset(reset), .synOut(inSynOut14));
		//synapse 21, synapse 22, synapse 23, synapse 24
		synapse in21(.preSpike(inspk21), .preDelay(delayin2), .postDelay(delayhid1), .tWin(tWin), .reset(reset), .synOut(inSynOut21));
		synapse in22(.preSpike(inspk22), .preDelay(delayin2), .postDelay(delayhid2), .tWin(tWin), .reset(reset), .synOut(inSynOut22));
		synapse in23(.preSpike(inspk23), .preDelay(delayin2), .postDelay(delayhid3), .tWin(tWin), .reset(reset), .synOut(inSynOut23));
		synapse in24(.preSpike(inspk24), .preDelay(delayin2), .postDelay(delayhid4), .tWin(tWin), .reset(reset), .synOut(inSynOut24));
		//synapse 31, synapse 32, synapse 33, synapse 34
		synapse in31(.preSpike(inspk31), .preDelay(delayin3), .postDelay(delayhid1), .tWin(tWin), .reset(reset), .synOut(inSynOut31));
		synapse in32(.preSpike(inspk32), .preDelay(delayin3), .postDelay(delayhid2), .tWin(tWin), .reset(reset), .synOut(inSynOut32));
		synapse in33(.preSpike(inspk33), .preDelay(delayin3), .postDelay(delayhid3), .tWin(tWin), .reset(reset), .synOut(inSynOut33));
		synapse in34(.preSpike(inspk34), .preDelay(delayin3), .postDelay(delayhid4), .tWin(tWin), .reset(reset), .synOut(inSynOut34));

	//hidden layer neurons and synapse

		//neuron n1
		neuron3 hidn1(.inspk1(inSynOut11), .inspk2(inSynOut21), .inspk3(inSynOut31), .clk(clk), .reset(reset), .spike(spk1), .outDelay(delayhid1));
		//neuron n2
		neuron3 hidn2(.inspk1(inSynOut12), .inspk2(inSynOut22), .inspk3(inSynOut32), .clk(clk), .reset(reset), .spike(spk2), .outDelay(delayhid2));
		//neuron n3
		neuron3 hidn3(.inspk1(inSynOut13), .inspk2(inSynOut23), .inspk3(inSynOut33), .clk(clk), .reset(reset), .spike(spk3), .outDelay(delayhid3));
		//neuron n4
		neuron3 hidn4(.inspk1(inSynOut14), .inspk2(inSynOut24), .inspk3(inSynOut34), .clk(clk), .reset(reset), .spike(spk4), .outDelay(delayhid4));

		//synapse 11, synapse 12, synapse 13
		synapse hid11(.preSpike(hidspk11), .preDelay(delayhid1), .postDelay(delayout1), .tWin(tWin), .reset(reset), .synOut(hidSynOut11));
		synapse hid12(.preSpike(hidspk12), .preDelay(delayhid1), .postDelay(delayout2), .tWin(tWin), .reset(reset), .synOut(hidSynOut12));
		synapse hid13(.preSpike(hidspk13), .preDelay(delayhid1), .postDelay(delayout3), .tWin(tWin), .reset(reset), .synOut(hidSynOut13));
		//synapse 21, synapse 22, synapse 23
		synapse hid21(.preSpike(hidspk21), .preDelay(delayhid2), .postDelay(delayout1), .tWin(tWin), .reset(reset), .synOut(hidSynOut21));
		synapse hid22(.preSpike(hidspk22), .preDelay(delayhid2), .postDelay(delayout2), .tWin(tWin), .reset(reset), .synOut(hidSynOut22));
		synapse hid23(.preSpike(hidspk23), .preDelay(delayhid2), .postDelay(delayout3), .tWin(tWin), .reset(reset), .synOut(hidSynOut23));
		//synapse 31, synapse 32, synapse 33
		synapse hid31(.preSpike(hidspk31), .preDelay(delayhid3), .postDelay(delayout1), .tWin(tWin), .reset(reset), .synOut(hidSynOut31));
		synapse hid32(.preSpike(hidspk32), .preDelay(delayhid3), .postDelay(delayout2), .tWin(tWin), .reset(reset), .synOut(hidSynOut32));
		synapse hid33(.preSpike(hidspk33), .preDelay(delayhid3), .postDelay(delayout3), .tWin(tWin), .reset(reset), .synOut(hidSynOut33));
		//synapse 41, synapse 42, synapse 43
		synapse hid41(.preSpike(hidspk41), .preDelay(delayhid4), .postDelay(delayout1), .tWin(tWin), .reset(reset), .synOut(hidSynOut41));
		synapse hid42(.preSpike(hidspk42), .preDelay(delayhid4), .postDelay(delayout2), .tWin(tWin), .reset(reset), .synOut(hidSynOut42));
		synapse hid43(.preSpike(hidspk43), .preDelay(delayhid4), .postDelay(delayout3), .tWin(tWin), .reset(reset), .synOut(hidSynOut43));
	
	//output neurons

		//neuron 1
		neuron4 outn1(.inspk1(hidSynOut11), .inspk2(hidSynOut21), .inspk3(hidSynOut31), .inspk4(hidSynOut41), .clk(clk), .reset(reset), .spike(spk4), .outDelay(delayout1));
		//neuron 2
		neuron4 outn2(.inspk1(hidSynOut12), .inspk2(hidSynOut22), .inspk3(hidSynOut32), .inspk4(hidOutSyn42), .clk(clk), .reset(reset), .spike(spk4), .outDelay(delayout2));
		//neuron 3
		neuron4 outn3(.inspk1(hidSynOut31), .inspk2(hidSynOut32), .inspk3(hidSynOut33), .inspk4(hidOutSyn43), .clk(clk), .reset(reset), .spike(spk4), .outDelay(delayout3));


	
endmodule			
