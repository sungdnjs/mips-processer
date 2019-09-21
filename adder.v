`timescale 1ns/1ps
// simple adder
module adder(input  [31:0] a, b,
             output [31:0] y);

  assign #1 y = a + b;
endmodule