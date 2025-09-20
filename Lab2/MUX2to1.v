module MUX2to1(
	input      src1,
	input      src2,
	input	   select,
	output reg result
	);
/* Write your code HERE */
    always@(*) begin
        if(select == 1'b1)
            result = src2;
        else
            result = src1;
    end

endmodule
