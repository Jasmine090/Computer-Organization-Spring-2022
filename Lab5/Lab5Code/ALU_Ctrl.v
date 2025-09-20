`timescale 1ns/1ps

module ALU_Ctrl(
    input       [4-1:0] instr,
    input       [2-1:0] ALUOp,
    output reg  [4-1:0] ALU_Ctrl_o
);
/* Write your code HERE */
wire [2:0] func3;
assign func3 = instr[2:0];
always@(*)begin
    if(ALUOp == 2'b10 & instr == 4'b0000)
        ALU_Ctrl_o = 4'b0010;
    else if(ALUOp == 2'b10 & instr == 4'b1000)
        ALU_Ctrl_o = 4'b0110;
    else if(ALUOp == 2'b10 & instr == 4'b0111)
        ALU_Ctrl_o = 4'b0000;
    else if(ALUOp == 2'b10 & instr == 4'b0110)
        ALU_Ctrl_o = 4'b0001;
    else if(ALUOp == 2'b10 & instr == 4'b0100)
        ALU_Ctrl_o = 4'b0100;
    else if(ALUOp == 2'b10 & instr == 4'b0010)
        ALU_Ctrl_o = 4'b0111;
    else if(ALUOp == 2'b10 & instr == 4'b0001)
        ALU_Ctrl_o = 4'b0101;
    else if(ALUOp == 2'b10 & instr == 4'b1101)
        ALU_Ctrl_o = 4'b0011;
    else if(ALUOp == 2'b00)
        ALU_Ctrl_o = 4'b0010;
    else
        ALU_Ctrl_o = 4'b0110;
        
end
endmodule