`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:47:12 11/08/2017
// Design Name:   memory
// Module Name:   C:/Xilinx/ARM/memory_sim.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_sim;

	// Inputs
	reg clk;
	reg we;
	reg [31:0] rwa;
	reg [31:0] roa;
	reg [31:0] wd;

	// Outputs
	wire [31:0] rwd;
	wire [31:0] rod;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.clk(clk), 
		.we(we), 
		.rwa(rwa), 
		.roa(roa), 
		.wd(wd), 
		.rwd(rwd),
		.rod(rod)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		we = 1;
		rwa = 1;
		roa = 0;
		wd = 0;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always 
		#1  clk =  ! clk; 
	always #2 rwa = rwa + 1'b1;
	always #2 roa = roa + 1'b1;
		
	always #3 wd = wd + 1'b1;
      
endmodule

