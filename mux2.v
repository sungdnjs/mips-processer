`timescale 1ns/1ps


// 2 input multiplexer
module mux2 #(parameter WIDTH = 8)
             (input  [WIDTH-1:0] d0, d1,
              input              s,
              output [WIDTH-1:0] y);

  assign #1 y = s ? d1 : d0;
endmodule