`timescale 1ns/1ps
// Hazard Detection Unit
module hazard_detection_unit(
							input  [4:0] rsD, rtD, rtE,
							input  [4:0] writeregE, writeregM, 
							input        regwriteE,
							input        memtoregE, memtoregM, branchD,		  
							output       stallF, stallD, flushE);
				  

  wire lwstallD, branchstallD;

  // stalls
  assign #1 lwstallD = ((rtE==rtD|rtE==rsD)&regwriteE&memtoregE);
  assign #1 branchstallD = (branchD&((regwriteE&((writeregE==rtD)|(writeregE==rsD)))|(memtoregM&((writeregM==rtD)|(writeregM==rsD)))));

  assign #1 stallD = (lwstallD|branchstallD);//stall state is 1
  assign #1 stallF = (lwstallD|branchstallD);
  assign #1 flushE = (lwstallD|branchstallD);

  
endmodule
