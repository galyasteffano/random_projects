	module testbench();
		wire[15:0] x,y,s;
		wire cin,cout;
			test_adder test (x,y,s,cin,cout);
			four_bit_adder adder (x,y,s,cin,cout);
	endmodule

	module test_adder(a_in,b_in,sum,cin,cout);
		input[15:0] sum;  //sum
		input cout;   	//carry out
		output[15:0] a_in,b_in	;	//a_in, b_in
		output cin;			//carry_in
		reg[15:0] a_in,b_in;
		reg cin;			//carry_in
		initial
			begin
			$monitor($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a_in,b_in,cin,sum,cout);
			$display($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a_in,b_in,cin,sum,cout); 
		/*	$monitor($time," a=%d, b=%d, c=%b, sum=%d, carry=%b ",a_in,b_in,cin,sum,cout);
			$display($time," a=%d, b=%d, c=%b, sum=%d, carry=%b ",a_in,b_in,cin,sum,cout);*/
				//#1 a_in=0;b_in=0;cin=0;
				#200	a_in=237;b_in=367;cin=0;
				#200	a_in=123;b_in=723;cin=0;
			    #200
			//	#1  a_in=4;b_in=13;cin=0;
			//	#1 a=1;b=7;cin=0;
			//	#20 a=1;b=30;cin=0;
				
			$display($time," a=%d, b=%d, c=%b, s=%d, carry=%b ",a_in,b_in,cin,sum,cout);	
			end
	endmodule

 //four bit adder
	module four_bit_adder(input[15:0] A,B,output[15:0]Sum,input carry_in,output carry_out);
		wire CA1,CA2,CA3,CA4,
				CA5,CA6,CA7,CA8,
				CA9,CA10,CA11,CA12,
				CA13,CA14,CA15;		//intermediate carries;
		
		//instantiate chain of full adders :)
		full_adder	FA0(Sum[0],CA1,A[0],B[0],carry_in),
					FA1(Sum[1],CA2,A[1],B[1],CA1),
					FA2(Sum[2],CA3,A[2],B[2],CA2),
					FA3(Sum[3],CA4,A[3],B[3],CA3),
					FA4(Sum[4],CA5,A[4],B[4],CA4),
					FA5(Sum[5],CA6,A[5],B[5],CA5),
					FA6(Sum[6],CA7,A[6],B[6],CA6),
					FA7(Sum[7],CA8,A[7],B[7],CA7),
					FA8(Sum[8],CA9,A[8],B[8],CA8),
					FA9(Sum[9],CA10,A[9],B[9],CA9),
					FA10(Sum[10],CA11,A[10],B[10],CA10),
					FA11(Sum[11],CA12,A[11],B[11],CA11),
					FA12(Sum[12],CA13,A[12],B[12],CA12),
					FA13(Sum[13],CA14,A[13],B[13],CA13),
					FA14(Sum[14],CA15,A[14],B[14],CA14),
					FA15(Sum[15],CA15,A[15],B[15],carry_out);
	endmodule				

//full adder 
	module full_adder(output sum,carry,input a,b,c);
		wire w1,w2,w3,w4;
		wire sum,carry;
			xor (w1,a,b);
			xor (sum,w1,c);
			and (w2,a,c);
			and (w3,b,c);
			and (w4,a,b);
			or (carry,w2,w3,w4);
		
	endmodule	