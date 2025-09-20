`timescale 1ns/1ps
module ForwardingUnit (
    input [5-1:0] IDEXE_RS1,
    input [5-1:0] IDEXE_RS2,
    input [5-1:0] EXEMEM_RD,
    input [5-1:0] MEMWB_RD,
    input EXEMEM_RegWrite,
    input MEMWB_RegWrite,
    output reg [2-1:0] ForwardA,
    output reg [2-1:0] ForwardB
);
/* Write your code HERE */
always@(*)begin
	if(IDEXE_RS1 == EXEMEM_RD && EXEMEM_RegWrite == 1'b1 && EXEMEM_RD != 1'b0)
		ForwardA = 2'b10;
	else if(IDEXE_RS1 == MEMWB_RD && MEMWB_RegWrite == 1'b1 && MEMWB_RD != 1'b0)
		ForwardA = 2'b01;
	else
		ForwardA = 2'b00;
end

always@(*)begin
	if(IDEXE_RS2 == EXEMEM_RD && EXEMEM_RegWrite == 1'b1 && EXEMEM_RD != 1'b0)
		ForwardB = 2'b10;
	else if(IDEXE_RS2 == MEMWB_RD && MEMWB_RegWrite == 1'b1 && MEMWB_RD != 1'b0)
		ForwardB = 2'b01;
	else
		ForwardB = 2'b00;
end
endmodule

