`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:51:07 10/30/2017 
// Design Name: 
// Module Name:    extend 
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
module extend( input [23:0] instr,
					input [1:0] immSrc,
					output reg [31:0] extImm
    );
	 initial extImm = 0;
	 always@(*)
	 case(immSrc)
		2'b00:   extImm = {24'b0 , instr[7:0]};
		2'b01:   extImm = {20'b0 , instr[11:0]};
		2'b10:   extImm = {{6{instr[23]}}, instr[23:0], 2'b00};
		default:   extImm = 32'bx;		
	 endcase
endmodule
