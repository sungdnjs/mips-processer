`timescale 1ns/1ps
module tb_mipscomputer;

	// Inputs
	reg clk;
	reg reset;
	
	wire memwrite;
	wire [31:0] imem_a, imem_rd;
	wire [31:0] dmem_a, dmem_rd, dmem_wd;
	
	
	//instantiate device to be tested
	mipscomputer dut(.clk(clk), .reset(reset), .pc(imem_a), .instr(imem_rd), .memwrite(memwrite), .aluout(dmem_a), .writedata(dmem_wd), .readdata(dmem_rd));
		
	//initialize test
	initial
		begin
			reset <= 1; #22; reset <= 0;
		end
	
	//generate clock to sequence tests
	always
		begin
			clk <= 1; #5; clk <= 0; #5;
		end

endmodule

