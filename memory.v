`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:03 11/04/2017 
// Design Name: 
// Module Name:    memory 
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
module memory #(parameter CAPACITY=64)(
					input clk, we, //write enable
					input [31:0]  rwa, roa,
					input [31:0]  wd, 
					output wire [31:0]  rwd, rod
    );
	 
	reg [31:0] slots[CAPACITY-1:0];
	integer i;
	initial for (i=0; i<CAPACITY; i=i+1 ) begin slots[i] <= 0; end
	
	always@(posedge clk) if ((rwa < CAPACITY) && we) slots[rwa] <= wd;

	assign rwd = (rwa < CAPACITY) ? slots[rwa] : 32'b0;
	assign rod = (roa < CAPACITY) ? slots[roa] : 32'b0;
endmodule
