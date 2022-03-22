`timescale 1ns / 1ps
module pre_process_TMY #(parameter WIDTH = 32)(
input [WIDTH-1:0] my,
output [WIDTH+1:0] TMY);

wire [WIDTH+1:0] SUM;

assign SUM=my+(my<<1);
assign TMY = SUM;
endmodule