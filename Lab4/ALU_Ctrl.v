
`timescale 1ns/1ps
/*instr[30,14:12]*/
module ALU_Ctrl(
    input       [4-1:0] instr,
    input       [2-1:0] ALUOp,
    output      [4-1:0] ALU_Ctrl_o
);
wire [2:0] func3;
assign func3 = instr[2:0];
assign ALU_Ctrl_o = (ALUOp == 2'b10 & instr == 4'b0000)? 4'b0010: //add
					(ALUOp == 2'b10 & instr == 4'b1000)? 4'b0110: //sub
					(ALUOp == 2'b10 & instr == 4'b0111)? 4'b0000: //and
					(ALUOp == 2'b10 & instr == 4'b0110)? 4'b0001: //or
					(ALUOp == 2'b10 & instr == 4'b0100)? 4'b0100://exclusive or
					(ALUOp == 2'b10 & instr == 4'b0010)? 4'b0111://slt
					(ALUOp == 2'b10 & instr == 4'b0001)? 4'b0101://shift left
					(ALUOp == 2'b10 & instr == 4'b1101)? 4'b0011://shift right
					(ALUOp == 2'b00)? 4'b0010://add
					 4'b0110;//sub

endmodule

