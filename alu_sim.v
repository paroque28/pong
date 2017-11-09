`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:45:21 11/06/2017
// Design Name:   alu
// Module Name:   C:/Xilinx/ARM/alu_sim.v
// Project Name:  ARM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_sim;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] control;

	// Outputs
	wire [31:0] result;
	wire [3:0] flags;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.a(a), 
		.b(b), 
		.control(control), 
		.result(result), 
		.flags(flags)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		control = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 2;
		b = 2;
		#10 control = 4'b0100;
		#10 control = 4'b0010;
		#10 control = 4'b0000;
		#10 control = 4'b1100;
	end
      
endmodule

