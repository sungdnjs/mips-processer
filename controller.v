`timescale 1ns/1ps
module controller(input        clk, reset,
                  input  [5:0] opD, functD,
                  input        flushE, equalD,
                  output       memtoregE, memtoregM, memtoregW, memwriteM,
                  output       pcsrcD, branchD, alusrcE,
                  output       regdstE, regwriteE, regwriteM, regwriteW,
                  output       jumpD,
						output 		 zeroextendD,
                  output [5:0] alucontrolE
						);

  wire [3:0] aluopD;

  wire       memtoregD, memwriteD, alusrcD, regdstD, regwriteD;
  wire [5:0] alucontrolD;
  wire       memwriteE;


  // main decoder
  maindec md(opD, memtoregD, memwriteD, branchD,
             alusrcD, regdstD, regwriteD, jumpD,
             zeroextendD, aluopD
				 );
  // alu decoder
  aludec  ad(functD, aluopD, alucontrolD);

  // check for branch
  assign pcsrcD = branchD & equalD;

  // pipeline registers - control path  
  // register between Decode and Execute stages
  floprc #(11) regE(clk, reset, flushE,
                  {memtoregD, memwriteD, alusrcD, regdstD, regwriteD, alucontrolD},
                  {memtoregE, memwriteE, alusrcE, regdstE, regwriteE,  alucontrolE}
						);
  // register between Execute and Memory stages
  flopr #(3) regM(clk, reset,
                  {memtoregE, memwriteE, regwriteE},
                  {memtoregM, memwriteM, regwriteM}
						);
  // register between Memory and Writeback stages
  flopr #(2) regW(clk, reset,
                  {memtoregM, regwriteM},
                  {memtoregW, regwriteW}
						);
endmodule
