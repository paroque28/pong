`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:46 10/31/2017 
// Design Name: 
// Module Name:    flipflop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module flipflop#(parameter WIDTH=32)(
    input clk, reset, enable,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
    );
	 initial q =0;
	 always@(posedge clk, posedge reset)
		if(reset)        q<=0;
		else if (enable) q<=d;
		else             q<=q;

endmodule
