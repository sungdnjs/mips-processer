`timescale 1ns/1ps

// extend sign of immediate value to 32 bits
module signext(input  [15:0] a,
					input 		  zero,
               output [31:0] y);

  // version with selection between zero and sign extetion
  assign #1 y = zero ? {16'b0, a} : {{16{a[15]}}, a};
endmodule