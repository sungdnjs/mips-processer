`timescale 1ns/1ps
module mipscomputer(input         clk, reset,
           output [31:0] 		writedata, aluout, pc, instr, readdata, 
           output       		memwrite
			  );


  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, aluout, writedata, readdata);
  imem imem(pc[7:2], instr);
  dmem dmem(clk, memwrite, aluout, writedata, readdata);

endmodule
