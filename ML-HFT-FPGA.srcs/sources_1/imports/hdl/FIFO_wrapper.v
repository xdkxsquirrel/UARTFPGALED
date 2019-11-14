//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Wed Nov 13 17:04:33 2019
//Host        : Bidlack running 64-bit major release  (build 9200)
//Command     : generate_target FIFO_wrapper.bd
//Design      : FIFO_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FIFO_wrapper
   (clk,
    din,
    dout,
    empty,
    full,
    rd_en,
    wr_en);
  input clk;
  input [7:0]din;
  output [7:0]dout;
  output empty;
  output full;
  input rd_en;
  input wr_en;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire wr_en;

  FIFO FIFO_i
       (.clk(clk),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_en(rd_en),
        .wr_en(wr_en));
endmodule
