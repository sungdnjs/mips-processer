`timescale 1ns/1ps

module mips(input         clk, reset,
            output [31:0] pcF,
            input  [31:0] instrF,
            output        memwriteM,
            output [31:0] aluoutM, writedataM,
            input  [31:0] readdataM
				);

  wire [5:0]  opD, functD;
  wire        regdstE, alusrcE,
              pcsrcD,
              memtoregE, memtoregM, memtoregW, 
				  regwriteE, regwriteM, regwriteW;
  
  wire        flushE, equalD, branchD, jumpD, zeroextendD;
  
  wire [5:0]  alucontrolE;

  controller c(clk, reset, opD, functD, flushE, equalD,
               memtoregE, memtoregM, memtoregW, memwriteM, pcsrcD, branchD,
               alusrcE, regdstE, regwriteE, regwriteM, regwriteW, jumpD,
               zeroextendD, alucontrolE
					);
  datapath dp(clk, reset, memtoregE, memtoregM, memtoregW, pcsrcD, branchD,
              alusrcE, regdstE, regwriteE, regwriteM, regwriteW, jumpD,
              zeroextendD, alucontrolE, equalD, pcF, instrF,
              aluoutM, writedataM, readdataM,
              opD, functD, flushE
				  );
endmodule





