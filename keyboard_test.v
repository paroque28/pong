`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:45 10/30/2017 
// Design Name: 
// Module Name:    keyboard_test 
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
module keyboard_test(
		input clk, btnp, PS2KeyboardData, PS2KeyboardClk,
		output reg[7:0] led
    );
	 wire [7:0] rx_data;
	 wire done;
    // instantiate ps2 receiver
    ps2_rx ps2_rx_unit (.clk(clk), .reset(btnp), .rx_en(1'b1), .ps2d(PS2KeyboardData), .ps2c(PS2KeyboardClk), .rx_done_tick(done), .rx_data(rx_data));
	
	always@(*)
	begin
		if(done == 1'b1) led = rx_data; 
	end
	
	
endmodule
