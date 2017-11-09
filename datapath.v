`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:06 10/31/2017 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
    input clk, reset,
    input [1:0] regSrc,
    input regWrite,
    input [1:0] immSrc,
    input ALUSrc,
    input [3:0] ALUControl,
    input memToReg,
    input PCSrc,
    input [31:0] instr,
    input [31:0] readData,
    output wire [3:0] ALUFlags,
    output wire [31:0] PC,
    output wire [31:0] ALUResult, writeData
    );

	wire [31:0]   PCNext, PCPlus4, PCPlus8;
	wire [31:0]   extImm, srcA, srcB, regIn;
	wire [31:0]   RA1, RA2;
	
	mux2 #(32) pcmux(PCPlus4, regIn, PCSrc,PCNext);
	flipflop #(32) pcreg(clk, reset, 1'b1, PCNext, PC);
	adder #(32) pcadd1(PC, 32'b1, PCPlus4);
	adder #(32) pcadd2(PC, 32'b10, PCPlus8);


	mux2 #(4) ra1mux(instr[19:16], 4'b1111, regSrc[0], RA1);
	mux2 #(4) ra2mux(instr[3:0], instr[15:12], regSrc[1], RA2);
	regfile rf(clk, regWrite, RA1, RA2, instr[15:12], regIn, PCPlus8,srcA, writeData);
	mux2 #(32) resmux(ALUResult, readData, memToReg, regIn);
	extend ext(instr[23:0], immSrc, extImm);
	// ALU logic
	mux2 #(32) srcbmux(writeData, extImm, ALUSrc, srcB);
	alu alu(srcA, srcB, ALUControl, ALUResult, ALUFlags);
endmodule
