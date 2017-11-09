`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:15:56 10/31/2017 
// Design Name: 
// Module Name:    mux2 
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
module mux2#(parameter WIDTH=32) (
    input [WIDTH-1:0] d0, d1,
    input sel,
    output wire [WIDTH-1:0] y
    );
	assign y = sel ? d1 : d0;
	

endmodule
