	module testbench();
		wire[3:0] x,y,s;
		wire cin,cout;
			test_adder test (x,y,s,cin,cout);
			four_bit_adder adder (x,y,s,cin,cout);
	endmodule

	module test_adder(a_in,b_in,sum,cin,cout);
		input[3:0] sum;  //sum
		input cout;   	//carry out
		output[3:0] a_in,b_in	;	//a_in, b_in
		output cin;			//carry_in
		reg[3:0] a_in,b_in;
		reg cin;			//carry_in
		initial
			begin
			$monitor($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a_in,b_in,cin,sum,cout);
			$display($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a_in,b_in,cin,sum,cout);
				//#1 a_in=0;b_in=0;cin=0;
				#1	a_in=2;b_in=3;cin=0;
				
				#1	a_in=1;b_in=7;cin=0;
			
			//	#20	a_in=15;b_in=3;cin=0;
				
			//	#20	a_in=18;b_in=7;cin=0;
				#20
			//	#1  a_in=4;b_in=13;cin=0;
			//	#1 a=1;b=7;cin=0;
			//	#20 a=1;b=30;cin=0;
				
			$display($time," a=%d, b=%d, c=%b, s=%d, carry=%b ",a_in,b_in,cin,sum,cout);	
			end
	endmodule

 //four bit adder
	module four_bit_adder(input[3:0] A,B,output[3:0]Sum,input carry_in,output carry_out);
		wire carry_in_1,carry_in_2,carry_in_3;		//intermediate carries;
		
		//instantiate chain of full adders :)
		full_adder	FA0(Sum[0],carry_in_1,A[0],B[0],carry_in),
					FA1(Sum[1],carry_in_2,A[1],B[1],carry_in_1),
					FA2(Sum[2],carry_in_3,A[2],B[2],carry_in_2),
					FA3(Sum[3],carry_out, A[3],B[3],carry_in_3);
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