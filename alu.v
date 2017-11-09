`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:38 11/04/2017 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] a, b,
    input [3:0] control,
    output wire [31:0] result,
    output wire[3:0] flags
);

reg [32:0] result_pre ;
initial result_pre = 0;
assign result = result_pre[31:0];
assign flags[1] = result_pre[32]; //carry
assign flags[0] = (a[31] == b[31]) && (result_pre[31]!=b[31]); // overflow
assign flags[2] = result_pre[31:0] == 32'b0;// zero
assign flags[3] = result_pre[31];

always@(*)
begin
	casex(control)
		4'b0100: result_pre = a + b; // ADD
		4'b0010: result_pre = a - b; // SUB
		4'b0000: result_pre = a & b; // AND
		4'b1100: result_pre = a | b; // ORR
		4'b1101: result_pre = b; // MOV
		4'b1111: result_pre = ~b; // MVN
		default: result_pre = 33'b0; // unimplemented			
	endcase
end
endmodule
