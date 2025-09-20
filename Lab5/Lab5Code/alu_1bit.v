`timescale 1ns/1ps

module alu_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input				less,       //1 bit less      (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
	);

/* Write your code HERE */
    wire out1, out2, out3, out4, cout1, in1, in2;
    assign out1 = (temp1 & temp2);
    assign out2 = (temp1 | temp2);
    assign out3 = (temp1 ^ temp2 ^ cin);
    assign out4 = less;	
    assign cout1 = ((temp1 & temp2 & (operation[1])) | ((temp1 ^ temp2) & cin));
    MUX2to1 put1(
		.src1(src1), 
		.src2(~src1), 
		.select(Ainvert), 
		.result(temp1));
	MUX2to1 put2(
		.src1(src2), 
		.src2(~src2), 
		.select(Binvert), 
		.result(temp2));	
	MUX4to1 out(
		.src1(out1), 
		.src2(out2), 
		.src3(out3), 
		.src4(out4), 
		.select(operation), 
		.result(ans));
    always@(*)begin
        cout = cout1;
        result = ans;
    end
endmodule
