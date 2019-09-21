`timescale 1ns/1ps
module dmem(input         clk, we,
            input  [31:0] a, wd,
            output [31:0] rd);

  reg  [31:0] RAM[63:0];

  assign rd = RAM[a[31:2]]; // word aligned

  //initialize datamemory '0'
  initial begin
		$readmemh("C:/project3/data_memfile.dat",RAM);
  end
  
  always @(posedge clk) begin
    if (we)
      RAM[a[31:2]] <= wd;
  end
endmodule
