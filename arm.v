`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:20 11/04/2017 
// Design Name: 
// Module Name:    arm 
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
module arm(input clk, reset,
				output [31:0] PC,
				input [31:0] Instr,
				output wire MemWrite,
				output wire[31:0] ALUResult, WriteData,
				input [31:0] ReadData);
				
	wire [3:0] ALUFlags, ALUControl;
	wire RegWrite,	ALUSrc, MemtoReg, PCSrc;
	wire [1:0] RegSrc, ImmSrc ;
	
	
	controller c(clk, reset, Instr[31:12], ALUFlags,RegSrc, RegWrite, ImmSrc,
						ALUSrc, ALUControl,MemWrite, MemtoReg, PCSrc);
	
	datapath dp(clk, reset,	RegSrc, RegWrite, ImmSrc,	ALUSrc, ALUControl,	MemtoReg, 
						PCSrc, Instr, ReadData, ALUFlags, PC,ALUResult, WriteData);
endmodule
