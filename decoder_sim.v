`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:16:57 11/07/2017
// Design Name:   decoder
// Module Name:   C:/Xilinx/ARM/decoder_sim.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_sim;

	// Inputs
	reg [1:0] op;
	reg [5:0] funct;
	reg [3:0] rd;

	// Outputs
	wire [1:0] flagW;
	wire PCS;
	wire regW;
	wire memW;
	wire memtoReg;
	wire ALUSrc;
	wire [1:0] immSrc;
	wire [1:0] regSrc;
	wire [3:0] ALUControl;

	// Instantiate the Unit Under Test (UUT)
	decoder uut (
		.op(op), 
		.funct(funct), 
		.rd(rd), 
		.flagW(flagW), 
		.PCS(PCS), 
		.regW(regW), 
		.memW(memW), 
		.memtoReg(memtoReg), 
		.ALUSrc(ALUSrc), 
		.immSrc(immSrc), 
		.regSrc(regSrc), 
		.ALUControl(ALUControl)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		funct = 0;
		rd = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

