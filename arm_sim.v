`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:14:44 11/06/2017
// Design Name:   arm
// Module Name:   C:/Xilinx/ARM/arm_sim.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module arm_sim;

	// Inputs
	reg clk;
	reg reset;
	

	// Outputs
	wire [31:0] PC;
	wire MemWrite;
	wire [31:0] ALUResult;
	wire [31:0] WriteData;
	wire [31:0] Instr;
	wire [31:0] ReadData;

	// Instantiate the Unit Under Test (UUT)

	InstructionMemory ins(.address(PC),.data(Instr));
	memory m(.clk(clk),.we(MemWrite),.rwa(ALUResult),.roa(32'b0),.wd(WriteData),.rwd(ReadData));
	
	arm uut (
		.clk(clk), 
		.reset(reset), 
		.PC(PC), 
		.Instr(Instr),
		.MemWrite(MemWrite), 
		.ALUResult(ALUResult), 
		.WriteData(WriteData), 
		.ReadData(ReadData)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
      #2
		// Add stimulus here
		#1 reset = 1;
		#1 reset = 0;
	end
      
		
	always 
		#1  clk =  ! clk; 

endmodule

