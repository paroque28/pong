`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:59 11/04/2017 
// Design Name: 
// Module Name:    regfile 
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
module regfile(
    input clk, we, //write enable
    input [3:0] ra1, ra2, wa, //addresses
    input [31:0] wd, r15, // data
    output wire [31:0] rd1, rd2
    );
	
	reg [31:0] registers[14:0];
	integer i;
	initial for (i=0; i<15; i=i+1 ) begin registers[i] <= 0; end
	
	always@(posedge clk) if(we) registers[wa] <= wd;
	
	assign rd1 = (ra1 == 4'b1111) ? r15 : registers[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : registers[ra2];

endmodule
