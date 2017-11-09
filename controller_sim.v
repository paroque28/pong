`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:15:39 11/07/2017
// Design Name:   controller
// Module Name:   C:/Xilinx/ARM/controller_sim.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controller_sim;

	// Inputs
	reg clk;
	reg reset;
	reg [31:12] instr;
	reg [3:0] ALUFlags;

	// Outputs
	wire [1:0] regSrc;
	wire regWrite;
	wire [1:0] immSrc;
	wire ALUSrc;
	wire [1:0] ALUControl;
	wire memWrite;
	wire memtoReg;
	wire PCSrc;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.clk(clk), 
		.reset(reset), 
		.instr(instr), 
		.ALUFlags(ALUFlags), 
		.regSrc(regSrc), 
		.regWrite(regWrite), 
		.immSrc(immSrc), 
		.ALUSrc(ALUSrc), 
		.ALUControl(ALUControl), 
		.memWrite(memWrite), 
		.memtoReg(memtoReg), 
		.PCSrc(PCSrc)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		instr = 0;
		ALUFlags = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always 
		#1  clk =  ! clk; 

      
endmodule

