`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:21 11/04/2017 
// Design Name: 
// Module Name:    condreg 
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
module condlogic(input clk, reset,
					input [3:0] cond,
					input [3:0] ALUFlags,
					input [1:0] flagW,
					input PCS, regW, memW,
					output wire PCSrc, regWrite, memWrite
);


	wire [1:0] flagWrite;
	wire [3:0] flags;
	wire condEx;
	
	flipflop #(2) flagreg1(clk, reset, flagWrite[1],ALUFlags[3:2], flags[3:2]);
	flipflop #(2) flagreg0(clk, reset, flagWrite[0],ALUFlags[1:0], flags[1:0]);
	
	// write controls are conditional
	condcheck cc(cond, flags, condEx);
	
	assign flagWrite = flagW & {2{condEx}};
	assign regWrite = regW & condEx;
	assign memWrite = memW & condEx;
	assign PCSrc = PCS & condEx;
	
endmodule
	
	
module condcheck(input [3:0] cond,
						input [3:0] flags,
						output reg condEx
);
	
	initial condEx = 0;
	
	wire neg, zero, carry, overflow, ge;
	assign {neg, zero, carry, overflow} = flags;
	assign ge = (neg == overflow);
	
	always@(*)
	case(cond)
		4'b0000: condEx = zero; // EQ
		4'b0001: condEx = ~zero; // NE
		4'b0010: condEx = carry; // CS
		4'b0011: condEx = ~carry; // CC
		4'b0100: condEx = neg; // MI
		4'b0101: condEx = ~neg; // PL
		4'b0110: condEx = overflow; // VS
		4'b0111: condEx = ~overflow; // VC
		4'b1000: condEx = carry & ~zero; // HI
		4'b1001: condEx = ~(carry & ~zero); // LS
		4'b1010: condEx = ge; // GE
		4'b1011: condEx = ~ge; // LT
		4'b1100: condEx = ~zero & ge; // GT
		4'b1101: condEx = ~(~zero & ge); // LE
		4'b1110: condEx = 1'b1; // Always
		default: condEx = 1'bx; // undefined
	endcase
endmodule
