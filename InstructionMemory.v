`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:31 11/07/2017 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory#(parameter LENGTH = 32)(
    input [31:0] address,
    output reg [31:0] data
    );
	 
	reg [31:0] rom [0:LENGTH];
	
	
	initial $readmemh("program.hex", rom);
	
	always@(*)
	begin
	
		if(address < LENGTH ) data = rom[address];
		else data = 32'b0;
	
	end

endmodule
