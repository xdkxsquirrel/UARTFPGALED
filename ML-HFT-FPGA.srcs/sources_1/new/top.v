`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  University of Utah     
// Engineer:   Donovan Bidlack
// 
// Create Date: 07/17/2019 08:10:12 PM
// Module Name: top
// Project Name: MLA on an FPGA
// Target Devices: CMOD S7-25: Spartan 7
// Description: Takes UART input from the HFT Raspberry PI and returns
//                      the decisions made by the Machine Learning Algorithm
// 
//////////////////////////////////////////////////////////////////////////////////

module top(
	input        clk,
	input  [1:0] btn,
	input        pio48,
	output       led0_r,
	output       led0_g,
	output       led0_b,
	output       pio47
);

wire received_data_valid;
wire serial_data_valid;
wire transmit_data_valid;
wire [79:0] serial_data;
wire [7:0] received_byte;
wire [7:0] fifo_in;
wire [7:0] transmit_byte;
wire serial_active;
wire uart_active;
wire uart_done;
wire FIFO_full;
wire FIFO_empty;
wire ready_enable;
wire write_enable;

UART_RX rx(clk, pio48, received_data_valid, received_byte);
LED ledblock(clk, received_data_valid, received_byte, serial_active, led0_r, led0_g, led0_b, serial_data_valid, serial_data);
serializer SER(clk, uart_active, serial_data_valid, uart_done, serial_data, transmit_data_valid, serial_active, transmit_byte);
//FIFO_wrapper fifo(clk, fifo_in, transmit_byte, FIFO_empty, FIFO_full, ready_enable, write_enable);
UART_TX tx(clk, transmit_data_valid, transmit_byte, uart_active, pio47, uart_done);
endmodule
