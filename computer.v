`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:06 11/04/2017 
// Design Name: 
// Module Name:    computer 
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
module computer(
    );
	reg [31:0] rom [0:7];
	reg clk;
	wire [31:0] PC, result, writeData, readData;
	wire memWrite;
	initial begin
	  clk = 0;
	  $readmemh("program.hex", rom);
	end

	arm a(.clk(clk),.reset(1'b0),.PC(PC),.Instr(rom[PC]),.MemWrite(memWrite),.ALUResult(result),.WriteData(writeData),.ReadData(readData));
					
	memory m(.clk(clk),.we(memWrite),.ma1(result),.ma2(32'b0),.wd(writeData),.md1(readData));

	always 
		#1  clk =  ! clk; 

endmodule
