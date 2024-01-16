module bcd_to_binary (in,out);
	input [7:0] in;
	output [3:0] out;
	
	assign out[0]=in[0];
	assign out[1]=in[1]^in[4];
	assign out[2]=in[2]|(in[4]&in[1]);
	assign out[3]=in[3]|in[4];
	
endmodule
