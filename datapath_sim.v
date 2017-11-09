`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:12:28 11/07/2017
// Design Name:   datapath
// Module Name:   C:/Xilinx/ARM/datapath_sim.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datapath_sim;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0] regSrc;
	reg regWrite;
	reg [1:0] immSrc;
	reg ALUSrc;
	reg [3:0] ALUControl;
	reg memToReg;
	reg PCSrc;
	reg [31:0] instr;
	reg [31:0] readData;

	// Outputs
	wire [3:0] ALUFlags;
	wire [31:0] PC;
	wire [31:0] ALUResult;
	wire [31:0] writeData;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.clk(clk), 
		.reset(reset), 
		.regSrc(regSrc), 
		.regWrite(regWrite), 
		.immSrc(immSrc), 
		.ALUSrc(ALUSrc), 
		.ALUControl(ALUControl), 
		.memToReg(memToReg), 
		.PCSrc(PCSrc), 
		.instr(instr), 
		.readData(readData), 
		.ALUFlags(ALUFlags), 
		.PC(PC), 
		.ALUResult(ALUResult), 
		.writeData(writeData)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		regSrc = 0;
		regWrite = 0;
		immSrc = 0;
		ALUSrc = 0;
		ALUControl = 0;
		memToReg = 0;
		PCSrc = 0;
		instr = 0;
		readData = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
	end
      always 
		#1  clk =  ! clk; 

endmodule

