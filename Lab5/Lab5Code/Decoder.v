`timescale 1ns/1ps

module Decoder(
    input [32-1:0]  instr_i,
    output reg         Branch,
    output reg         ALUSrc,
    output reg         RegWrite,
    output reg [2-1:0] ALUOp,
    output reg         MemRead,
    output reg         MemWrite,
    output reg         MemtoReg,
    output reg         Jump
);

//Internal Signals
wire    [7-1:0]     opcode;
wire    [3-1:0]     funct3;
wire    [3-1:0]     Instr_field;
wire    [9:0]       Ctrl_o;

/* Write your code HERE */
assign opcode = instr_i[6:0];
always@(*)begin
	if(opcode == 7'b0110011)begin//rtype
		ALUSrc = 1'b0;//rs2
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		ALUOp = 2'b00;
		Jump = 1'b0;
	end
	else if(opcode == 7'b0010011)begin//itype
		ALUSrc = 1'b1;//imm
		MemtoReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		ALUOp = 2'b00;
		Jump = 1'b0;
	end
	else if(opcode == 7'b0000011)begin//lw
		ALUSrc = 1'b1;//imm
		MemtoReg = 1'b1;
		RegWrite = 1'b1;
		MemRead = 1'b1;
		MemWrite = 1'b0;
		Branch = 1'b0;
		ALUOp = 2'b00;
		Jump = 1'b0;
	end
	else if(opcode == 7'b0100011)begin//store
		ALUSrc = 1'b1;//imm
		MemtoReg = 1'b1;
		RegWrite = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b1;
		Branch = 1'b0;
		ALUOp = 2'b00;
		Jump = 1'b0;
	end
	else if(opcode == 7'b1100011)begin//branch
		ALUSrc = 1'b0;//rs2
		MemtoReg = 1'b0;
		RegWrite = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b1;
		ALUOp = 2'b01;
		Jump = 1'b0;
	end
	else if(opcode == 7'b1101111)begin//jal
		ALUSrc = 1'b0;//rs2
		MemtoReg = 1'b0;
		RegWrite = 1'b1;//write pc+4
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		ALUOp = 2'b11;
		Jump = 1'b1;
	end
	else if(opcode == 7'b1100111)begin//jalr
		ALUSrc = 1'b0;//rs2
		MemtoReg = 1'b0;
		RegWrite = 1'b1;//write pc+4
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		ALUOp = 2'b11;
		Jump = 1'b1;
	end
end

endmodule







