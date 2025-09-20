`timescale 1ns/1ps

module alu(
    input                   rst_n,         // negative reset            (input)
    input        [32-1:0]   src1,          // 32 bits source 1          (input)
    input        [32-1:0]   src2,          // 32 bits source 2          (input)
    input        [ 4-1:0]   ALU_control,   // 4 bits ALU control input  (input)
    output reg   [32-1:0]   result,        // 32 bits result            (output)
    output reg              zero           // 1 bit when the output is 0, zero must be set (output)
);

/* Write your code HERE */
wire set, ainv, binv;
wire [1:0] ope;
wire [32-1:0] Cin;
wire [32-1:0] ans;
assign set = src1[31] ^ (~src2[31]) ^ Cin[30];
assign ainv = ALU_control[3];
assign binv = ALU_control[2];
assign ope = ALU_control[1:0]; 
alu_1bit alu0(
	.src1(src1[0]), 
	.src2(src2[0]), 
	.less(set), 
	.Ainvert(ainv), 
	.Binvert(binv), 
	.cin((ainv ^ binv)), 
	.operation(ope), 
	.result(ans[0]), 
	.cout(Cin[0]));

genvar i;
generate
    for(i=1 ; i<32 ; i=i+1)begin
        alu_1bit alu(
			.src1(src1[i]), 
			.src2(src2[i]), 
			.less(1'b0), 
			.Ainvert(ainv), 
			.Binvert(binv), 
			.cin(Cin[i-1]), 
			.operation(ope), 
			.result(ans[i]), 
			.cout(Cin[i]));
    end
endgenerate

always@(*)begin
    if(rst_n==1'b1) begin
        if(ALU_control == 4'b0100)begin
            result = src1 ^ src2;
            zero = 1'b0;
        end
        else if(ALU_control == 4'b0101)begin
            result = src1 << src2;
            zero = 1'b0;
        end
        else if(ALU_control == 4'b0011)begin
            result = src1 >>> src2;
            zero = 1'b0;
        end
        else begin
            result = ans;
            zero = ~(|result);
        end
    end
    else begin
        result = 32'b0;
        zero = 1'b0;
    end
end
endmodule
