`timescale 1ns/1ps

module ALU_Ctrl(
	input		[4-1:0]	instr,
	input		[2-1:0]	ALUOp,
	output	reg [4-1:0] ALU_Ctrl_o
	);
	
/* Write your code HERE */
always@(*)begin
    if(ALUOp == 2'b10 && instr == 4'b0000)//add//2
        ALU_Ctrl_o = 4'b0010;
    else if(ALUOp == 2'b10 && instr == 4'b1000)//sub//6
        ALU_Ctrl_o = 4'b0110;
    else if(ALUOp == 2'b10 && instr == 4'b0111)//and//0
        ALU_Ctrl_o = 4'b0000;
    else if(ALUOp == 2'b10 && instr == 4'b0110)//or//1
        ALU_Ctrl_o = 4'b0001;
    else if(ALUOp == 2'b10 && instr == 4'b0100)//exclusive_or//4
        ALU_Ctrl_o = 4'b0100;
    else if(ALUOp == 2'b10 && instr == 4'b0010)//less//7
        ALU_Ctrl_o = 4'b0111;
    else if(ALUOp == 2'b10 && instr == 4'b0001)//shift_left//5
        ALU_Ctrl_o = 4'b0101;
    else if(ALUOp == 2'b10 && instr == 4'b1101)//shift_right//3
        ALU_Ctrl_o = 4'b0011;
end

endmodule
