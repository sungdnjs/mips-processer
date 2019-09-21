`timescale 1ns/1ps
module datapath(input         clk, reset,
                input         memtoregE, memtoregM, memtoregW,
                input         pcsrcD, branchD,
                input         alusrcE, regdstE,
                input         regwriteE, regwriteM, regwriteW,
                input         jumpD,
					 input 			zeroextendD,
                input  [5:0]  alucontrolE,
                output        equalD,
                output [31:0] pcF,
                input  [31:0] instrF,
                output [31:0] aluoutM, writedataM,
                input  [31:0] readdataM,
                output [5:0]  opD, functD,
                output        flushE
					 );

  wire        forwardaD, forwardbD;
  wire [1:0]  forwardaE, forwardbE;
  wire        stallF,stallD;
  wire [4:0]  rsD, rtD, rdD, rsE, rtE, rdE;
  wire [4:0]  writeregE, writeregM, writeregW;
  wire        flushD;
  
  wire [31:0] pcnextFD, pcnextbrFD, pcplus4F, pcbranchD;
  wire [31:0] signimmD, signimmE, signimmshD;
  wire [31:0] srcaD, srca2D, srcaE, srca2E;
  wire [31:0] srcbD, srcb2D, srcbE, srcb2E, srcb3E;
  wire [31:0] pcplus4D, instrD;
  wire [31:0] aluoutE, aluoutW;
  wire [31:0] readdataW, resultW;

  //before : hazard
  //after : hazard --(split)--> hazard_detection_unit , forwarding_unit
  
  // Hazard Detection Unit
  hazard_detection_unit    hd_unit(rsD, rtD, rtE,
												writeregE, writeregM, 
												regwriteE,
												memtoregE, memtoregM, branchD,		  
												stallF, stallD, flushE); // coding this module
	
	// Forwarding Unit Decode/Excution stage
	forwarding_unit 	fd_unit(rsD, rtD, rsE, rtE,
										writeregM, writeregW,
										regwriteM, regwriteW,
										forwardaD, forwardbD,
										forwardaE, forwardbE);
				  
	//--------------------------------------------------//				  
				  
  // next PC logic (operates in fetch and decode)
  mux2 #(32)  pcbrmux(pcplus4F, pcbranchD, pcsrcD, pcnextbrFD);///
  mux2 #(32)  pcmux(pcnextbrFD,{pcplus4D[31:28], instrD[25:0], 2'b00},
                    jumpD, pcnextFD);//

  // register file (operates in decode and writeback)
  regfile     rf(clk, regwriteW, rsD, rtD, writeregW,
                 resultW, srcaD, srcbD);///

  //-- Fetch stage logic ---
  // F latch / PC register
  flopenr #(32) pcreg(clk, reset, ~stallF, pcnextFD, pcF);///
  // PC adder/incrementer, add 4 to PC
  adder       pcadd1(pcF, 32'b100, pcplus4F);///

  //-- Decode stage ---
  // D latch / decode stage register (upper part)
  flopenrc #(32) r2D(clk, reset, ~stallD, flushD, instrF, instrD);///
  // D latch / decode stage register (lower part)
  flopenr #(32) r1D(clk, reset, ~stallD, pcplus4F, pcplus4D);///
  // sign extend immediate value
  signext     se(instrD[15:0], zeroextendD, signimmD);///
  // shift left immediate value by 2
  sl2         immsh(signimmD, signimmshD);///
  // add to to PC sign extended and shifted immediate value (branch)
  adder       pcadd2(pcplus4D, signimmshD, pcbranchD);///
  // forwarding multiplexers
  mux2 #(32)  forwardadmux(srcaD, aluoutM, forwardaD, srca2D);
  mux2 #(32)  forwardbdmux(srcbD, aluoutM, forwardbD, srcb2D);
  // branch prediction comparator
  eqcmp       comp(srca2D, srcb2D, equalD);///

  // get operation code (6 bit) from instruction
  assign opD = instrD[31:26];///
  // get function code (6 bit) from instruction
  assign functD = instrD[5:0];///
  // get source register (5 bit) from instruction
  assign rsD = instrD[25:21];///
  // get target register (5 bit) from instruction
  assign rtD = instrD[20:16];///
  // get destination register (5 bit) from instruction
  assign rdD = instrD[15:11];///

  // flush D latch if branch or jump
  assign flushD = pcsrcD | jumpD;///
  //---

  //-- Execute stage ---
  // latch E
  floprc #(32) r1E(clk, reset, flushE, srcaD, srcaE);///
  floprc #(32) r2E(clk, reset, flushE, srcbD, srcbE);///
  floprc #(32) r3E(clk, reset, flushE, signimmD, signimmE);///
  floprc #(5)  r4E(clk, reset, flushE, rsD, rsE);///
  floprc #(5)  r5E(clk, reset, flushE, rtD, rtE);///
  floprc #(5)  r6E(clk, reset, flushE, rdD, rdE);///
  // forwarding multiplexers
  mux3 #(32)  forwardaemux(srcaE, resultW, aluoutM, forwardaE, srca2E);///
  mux3 #(32)  forwardbemux(srcbE, resultW, aluoutM, forwardbE, srcb2E);///
  // ALU B operand source selector
  mux2 #(32)  srcbmux(srcb2E, signimmE, alusrcE, srcb3E);///
  // ALU Unit
  alu         alu(srca2E, srcb3E, alucontrolE, aluoutE);///
  // Write register selector (rt or td)
  mux2 #(5)   wrmux(rtE, rdE, regdstE, writeregE);///
  // ---

  //-- Memory stage ---
  // latch M
  flopr #(32) r1M(clk, reset, srcb2E, writedataM);///
  flopr #(32) r2M(clk, reset, aluoutE, aluoutM);///
  flopr #(5)  r3M(clk, reset, writeregE, writeregM);///

  //-- Writeback stage ---
  // latch W
  flopr #(32) r1W(clk, reset, aluoutM, aluoutW);///
  flopr #(32) r2W(clk, reset, readdataM, readdataW);///
  flopr #(5)  r3W(clk, reset, writeregM, writeregW);///
  // result selector (from ALU or Memory)
  mux2 #(32)  resmux(aluoutW, readdataW, memtoregW, resultW);///

endmodule