//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Wed Nov 13 17:04:33 2019
//Host        : Bidlack running 64-bit major release  (build 9200)
//Command     : generate_target FIFO.bd
//Design      : FIFO
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "FIFO,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FIFO,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "FIFO.hwdef" *) 
module FIFO
   (clk,
    din,
    dout,
    empty,
    full,
    rd_en,
    wr_en);
  input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DIN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DIN, LAYERED_METADATA undef" *) input [7:0]din;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DOUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DOUT, LAYERED_METADATA undef" *) output [7:0]dout;
  output empty;
  output full;
  input rd_en;
  input wr_en;

  wire clk_1;
  wire [7:0]din_1;
  wire [7:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_full;
  wire rd_en_1;
  wire wr_en_1;

  assign clk_1 = clk;
  assign din_1 = din[7:0];
  assign dout[7:0] = fifo_generator_0_dout;
  assign empty = fifo_generator_0_empty;
  assign full = fifo_generator_0_full;
  assign rd_en_1 = rd_en;
  assign wr_en_1 = wr_en;
  FIFO_fifo_generator_0_0 fifo_generator_0
       (.clk(clk_1),
        .din(din_1),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .full(fifo_generator_0_full),
        .rd_en(rd_en_1),
        .wr_en(wr_en_1));
endmodule
