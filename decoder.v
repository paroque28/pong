`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:48 11/04/2017 
// Design Name: 
// Module Name:    decoder 
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
module decoder(input  [1:0] op,
					input  [5:0] funct,
					input  [3:0] rd,
					output reg [1:0] flagW,
					output wire PCS,
					output reg regW, memW,
					output reg memtoReg, ALUSrc,
					output reg [1:0] immSrc, regSrc,
					output reg [3:0] ALUControl);
					

	reg branch, ALUOp;
	initial begin flagW=0; regW=0; memW=0; memtoReg=0; ALUSrc=0; immSrc=0; regSrc=0; ALUControl=0; branch=0; ALUOp=0; end
	
	// Main Decoder
	always@(*)
		casex(op)
				// Data-processing immediate
				2'b00: if (funct[5]) {regSrc, immSrc, ALUSrc, memtoReg, regW, memW, branch, ALUOp} = 10'b0000101001;
				// Data-processing register
				else {regSrc, immSrc, ALUSrc, memtoReg, regW, memW, branch, ALUOp} = 10'b0000001001;
				// LDR
				2'b01: if (funct[0]) {regSrc, immSrc, ALUSrc, memtoReg, regW, memW, branch, ALUOp} = 10'b0001111000;
				// STR
				else {regSrc, immSrc, ALUSrc, memtoReg, regW, memW, branch, ALUOp} = 10'b1001110100;
				// Branch
				2'b10: {regSrc, immSrc, ALUSrc, memtoReg, regW, memW, branch, ALUOp} = 10'b0110100010;
				// Unimplemented
				default: {regSrc, immSrc, ALUSrc, memtoReg, regW, memW, branch, ALUOp} = 10'bx;
		endcase

	
	
	// ALU Decoder
	always@(*)
		if (ALUOp) begin // which DP Instr?
			case(funct[4:1])
				4'b0100: ALUControl = 4'b0100; // ADD
				4'b0010: ALUControl = 4'b0010; // SUB
				4'b0000: ALUControl = 4'b0000; // AND
				4'b1100: ALUControl = 4'b1100; // ORR
				4'b1101: ALUControl = 4'b1101; // MOV
				4'b1111: ALUControl = 4'b1111; // MVN
				default: ALUControl = 4'bx; // unimplemented	
			endcase
			// update flags if S bit is set (C & V only for arith)
			flagW[1] = funct[0];
			flagW[0] = funct[0] & (ALUControl == 4'b0100 | ALUControl == 4'b0100);
		end else begin
			ALUControl = 4'b1100; // add for non-DP instructions
			flagW = 2'b00; // don't update Flags
		end
		
	// PC reg
	assign PCS = ((rd == 4'b1111) & regW) | branch;
	
endmodule