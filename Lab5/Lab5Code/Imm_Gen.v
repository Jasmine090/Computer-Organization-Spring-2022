`timescale 1ns/1ps

module Imm_Gen(
    input      [31:0] instr_i,
    output reg [31:0] Imm_Gen_o
);

/* Write your code HERE */

//Internal Signals
wire    [7-1:0] opcode;
wire    [2:0]   func3;
wire    [3-1:0] Instr_field;

assign opcode = instr_i[6:0];
assign func3  = instr_i[14:12];

/* Write your code HERE */
wire I, S, B, J;
assign I = (opcode == 7'b0010011 || opcode == 7'b0000011 || opcode == 7'b1100111)?1'b1:1'b0;//addi//load//jalr
assign S = (opcode == 7'b0100011)?1'b1:1'b0;//store
assign B = (opcode == 7'b1100011)?1'b1:1'b0;//branch
assign J = (opcode == 7'b1101111)?1'b1:1'b0;//jal

wire [31:0]i,s,b,j;
assign i[11:0] = instr_i[31:20];
assign i[31:12] = {20{instr_i[31]}};

assign s[4:0] = instr_i[11:7];
assign s[11:5] = instr_i[31:25];
assign s[31:12] = {20{instr_i[31]}};

assign b[0] = 1'b0;
assign b[11:1] = {instr_i[7], instr_i[30:25], instr_i[11:8]};
assign b[31:12] = {20{instr_i[31]}};

assign j[19:0] = {instr_i[19:12], instr_i[20], instr_i[30:25], instr_i[24:21], 1'b0};
assign j[31:20] = {12{instr_i[31]}};

always@(*)begin
	if(I==1'b1)begin
		Imm_Gen_o = i;
	end
	else if(S==1'b1)begin
		Imm_Gen_o = s;
	end
	else if(B==1'b1)begin
		Imm_Gen_o = b;
	end
	else if(J==1'b1)begin
		Imm_Gen_o = j;
	end
end

endmodule
