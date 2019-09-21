`timescale 1ns/1ps
module maindec(input  [5:0] op,
               output       memtoreg, memwrite,
               output       branch, alusrc,
               output       regdst, regwrite,
               output       jump,
					output 		 zeroextend,
               output [3:0] aluop);

  reg [11:0] controls;

  assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, zeroextend, aluop} = controls;

  always @(*)
    case(op)
      6'b000000: controls = 12'b1_1_000000_1111; //Rtype
      6'b000010: controls = 12'b0_0_000010_0000; //J 
      6'b000100: controls = 12'b0_0_010000_0001; //BEQ
      6'b001000: controls = 12'b1_0_100000_0000; // ADDI
      6'b001001: controls = 12'b1_0_100000_0000; // ADDIU
      6'b001010: controls = 12'b1_0_100000_0010; // SLTI
      6'b001100: controls = 12'b1_0_100001_0100; // ANDI
      6'b001101: controls = 12'b1_0_100001_0101; // ORI
      6'b001110: controls = 12'b1_0_100001_0110; // XORI
      6'b001111: controls = 12'b1_0_100001_0111; // LUI
      6'b100011: controls = 12'b1_0_100100_0000; //LW
      6'b101011: controls = 12'b0_0_101000_0000; //SW
      default:   controls = 12'bxxxxxxxxx; //??? 
    endcase
endmodule
