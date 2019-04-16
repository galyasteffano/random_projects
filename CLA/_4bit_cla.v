//four bit adder

module testbench();
	wire [3:0] a,b,sum;
	wire cin, cout;
		test_adder test(a,b,cin,sum,cout);
		_4bits fa(a,b,cin,sum,cout);
endmodule

module test_adder(a,b,cin,cout,sum);
	input[3:0] sum;
	input cout;
	output[3:0] a,b;
	output cin;
	reg[3:0] a,b;
	reg cin;
	initial
		begin
		$monitor($time,"a =%b, b =%b, cin =%b, sum =%b, cout =%b",a,b,cin,sum,cout);
		$display($time,"a =%b, b =%b, cin =%b, sum =%b, cout =%b",a,b,cin,sum,cout);
		/* #20 a=2; b=3; cin=0;
		#20 a=1; b=7; cin=0;
		#20	a=4;b=10;  cin=0;
		#20	a=1;b=2;cin=0;
		*/
		
		$display($time,"a =%b, b =%b, cin =%b, sum =%b, cout =%b",a,b,cin,sum,cout);
		end
endmodule	

module _4bits( a, b,in_carry,sum,cout);
    output [3:0] sum;
    output cout;
	input in_carry;
    input [3:0] a, b;
    wire c0,c1,c2;   
    full_adder FA0 (a[0], b[0],in_carry,sum[0],c0);
    full_adder FA1(a[1],b[1],c0,sum[1],c1);
    full_adder FA2(a[2],b[2],c1,sum[2],c2);
    full_adder FA3(a[3],b[3],c2,sum[3],cout);
endmodule
	
/*
module four_bit_adder(a,b,cin,carry_out,sum);
	output[3:0] sum;
	output carry_out;
	input[3:0] a,b;
	wire[3:1] carry_in;
	full_adder FA0(a[0],b[0],cin,sum[0],carry_in[1]);
	full_adder FA1(a[1],b[1],carry_in[1],sum[1],carry_in[2]);
	full_adder FA2(a[2],b[2],carry_in[2],sum[2],carry_in[3]);
	full_adder FA3(a[3],b[3],carry_in[3],sum[3],carry_out);
	
endmodule
		*/
module full_adder(a,b,cin,sum,cout);
	wire w1,w2,w3,w4;
	input a,b,cin;
	output sum,cout;

	
	xor (w1,a,b);
	xor (sum,w1,cin);
	and (w2,a,cin);
	and (w3,b,cin);
	and (w4,a,b);
	or (cout,w2,w3,w4);
	
endmodule	