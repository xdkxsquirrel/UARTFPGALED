`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  University of Utah     
// Engineer:   Donovan Bidlack
// 
// Create Date: 07/17/2019 08:10:12 PM
// Module Name: MLA
// Project Name: MLA on an FPGA
// Target Devices: CMOD S7-25: Spartan 7
// Description: Takes UART input from the HFT Raspberry PI and returns
//                      the decisions made by the Machine Learning Algorithm
// 
//////////////////////////////////////////////////////////////////////////////////

module LED(
	input             clk,
	input             received_data_valid,
	input      [7:0]  received_byte,
	input             active,
	output reg        led4_r,
	output reg        led4_g,
	output reg        led4_b,
	output reg        transmit_data_valid,
	output reg [79:0] transmit
);

parameter GREEN     = "G";
parameter RED       = "R";
parameter BLUE      = "B";
parameter WHITE     = "W";

reg [79:0] temporary_transmit;
reg       ready = 0;

initial
begin
    led4_r <= 0;
    led4_g <= 1;
    led4_b <= 0;
end

always@(posedge clk)
begin
  if(received_data_valid)
    begin
      case (received_byte)
        GREEN :
          begin
          led4_r <= 1;
          led4_g <= 0;
          led4_b <= 1;
          temporary_transmit <= "THIS IS GR";
          ready <= 1;
          end
          
        RED :
          begin
          led4_r <= 0;
          led4_g <= 1;
          led4_b <= 1;
          temporary_transmit <= "RED HERE!!";
          ready <= 1;
          end
          
        BLUE :
          begin
          led4_r <= 1;
          led4_g <= 1;
          led4_b <= 0;
          temporary_transmit <= "blueBLUE#1";
          ready <= 1;
          end
          
        WHITE :
          begin
          led4_r <= 0;
          led4_g <= 0;
          led4_b <= 0;
          temporary_transmit <= "this one W";
          ready <= 1;
          end  
       
        default:
          begin
          led4_r <= 1;
          led4_g <= 1;
          led4_b <= 1;
          temporary_transmit <= 0;
          ready <= 0;
          end
      endcase
    end
  else
    ready <= 0;
end

always@(posedge clk)
begin
  if(!active && ready)
    begin
    transmit       <= temporary_transmit;
    transmit_data_valid <= 1;
    end
  else
    transmit_data_valid <= 0;
end

endmodule
          