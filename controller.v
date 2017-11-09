`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:59 11/04/2017 
// Design Name: 
// Module Name:    controller 
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
module controller(input clk, reset,
						input [31:12] instr,
						input [3:0] ALUFlags,
						output wire [1:0] regSrc,
						output wire regWrite,
						output wire [1:0] immSrc,
						output wire ALUSrc,
						output wire [3:0] ALUControl,
						output wire memWrite, memtoReg,
						output wire PCSrc);
wire [1:0] flagW;
wire PCS, regW, memW;

decoder dec(instr[27:26], instr[25:20], instr[15:12],flagW, PCS, regW, memW, memtoReg,
					ALUSrc, immSrc, regSrc, ALUControl);
condlogic cl(clk, reset, instr[31:28], ALUFlags, flagW, PCS, regW, memW,PCSrc, regWrite, 
					memWrite);

endmodule
