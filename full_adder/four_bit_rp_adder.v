module testbench();
	wire [3:0] a,b,sum;
	wire carry_in, carry;
		test_adder test(a,b,sum,carry,carry_in);
		full_adder adder(a,b,sum,carry,carry_in);
endmodule

module test_adder(a,b,sum,carry,carry_in);
	input [3:0]sum;
	input  carry;
	output [3:0] a,b;
	output carry_in;
	reg [3:0] a,b;
	reg carry_in;
	initial
		begin
		$monitor($time,"a =%b, b =%b, cin =%b, sum =%b, cout =%b",a,b,carry_in,sum,carry);
		$display($time,"a =%b, b =%b, cin =%b, sum =%b, cout =%b",a,b,carry_in,sum,carry);
			a=2; b=3; carry_in=0;
			a=1; b=7; carry_in=0;
		$display($time,"a =%b, b =%b, cin =%b, sum =%b, cout =%b",a,b,carry_in,sum,carry);
		end
endmodule	

module full_adder(a_in,b_in,c_in,sum,carry);
	output sum;
	output carry_out;
	input a_in,b_in,c_in;
	wire w1,w2,w3,w4;
	wire carry;
	wire sum;
	//reg a,b,c;
	//wire carry;
	
	xor   (w1,a_in,b_in);
	xor   (sum,w1,c_in);
	and   (w2,a_in,c_in);
	and   (w3,b,c_in);
	and   (w4,a_in,b_in);
	or    (carry,w2,w3,w4);
	
endmodule	