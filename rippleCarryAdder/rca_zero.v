	/*** zero gate delay ***/
	
	module testbench();
	
		wire[15:0] x,y,s;
		wire cin,cout;
			test_adder test (x,y,s,cout,cin);
			sixteen_bit_adder adder (x,y,s,cout,cin);
	endmodule
	
	
		module test_adder(a,b,s,cout,cin);
			input[15:0] s;  //sum
			input cout;   	//carry out
			output[15:0] a,b;	//a_in, b_in
			output cin;			//carry_in
			reg[15:0] a,b;
			reg cin;			//carry_in
		initial
			begin
		  //  $monitor($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a,b,cin,s,cout);
		  //$display($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a,b,cin,s,cout); 
			$monitor($time," a=%h, b=%h, c=%b, sum=%h, carry=%b ",a,b,cin,s,cout);
			$display($time," a=%h, b=%h, c=%h, sum=%h, carry=%b ",a,b,cin,s,cout);
				#20 a=1; b=4; cin=0;
				#20 a=6; b=9; cin=0;
				#20
				/** 2^7 ->2^4 **/
				#20 a=16;b=64;cin=0;    //lower
				#20 a=208;b=32;cin=0;   //upper
				#20 
				/** testing  2^11->2^8 **/
				#20 a=25;b=200;cin=0;
				#20 a=1990;b=58;cin=0;
				#20 a=2280; b=1560;cin=0;
			
			  //  #20 a=24575;b=27967;cin=0;
			  /*** testing 2^15 ->2^12 *  **/
				#20 a=53247;b=8192;cin=0; 
			    #20 a=26479;b=4158; cin=0;  //upper
				#20 a=40960;b=5;cin=0;
			//	#20 a=24576;b=6288;cin=0; 	//lower
			    #20	
			
			$display($time," a=%h, b=%h, c=%b, sum=%h, carry=%b ",a,b,cin,s,cout);
		//	$display($time," a=%d, b=%d, c=%b, sum=%h, carry=%b ",a,b,cin,s,cout);	
		//    $display($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a,b,cin,s,cout);
			end
	endmodule
	
	
	
	
	module sixteen_bit_adder(input[15:0]x,y,output[15:0]s,output cout,input cin);
		wire[15:0] c;
		
		full_adder FA0(x[0],y[0],cin,s[0],c[0]),
				   FA1(x[1],y[1],c[0],s[1],c[1]),
				   FA2(x[2],y[2],c[1],s[2],c[2]),
				   FA3(x[3],y[3],c[2],s[3],c[3]),
				   
				   FA4(x[4],y[4],c[3],s[4],c[4]),
				   FA5(x[5],y[5],c[4],s[5],c[5]),
				   FA6(x[6],y[6],c[5],s[6],c[6]),
				   FA7(x[7],y[7],c[6],s[7],c[7]),
					
				   FA8(x[8],y[8],c[7],s[8],c[8]),
				   FA9(x[9],y[9],c[8],s[9],c[9]),
				   FA10(x[10],y[10],c[9],s[10],c[10]),
				   FA11(x[11],y[11],c[10],s[11],c[11]),
				   
				   FA12(x[12],y[12],c[11],s[12],c[12]),
				   FA13(x[13],y[13],c[12],s[13],c[13]),
				   FA14(x[14],y[14],c[13],s[14],c[14]),
				   FA15(x[15],y[15],c[14],s[15],cout);
	endmodule
	
	
	
	
	
	
	
	
	/*** full adder ***/
	module full_adder(a,b,c,s,cout);
		input a,b,c;
		output s,cout;
		//wire w1,w2,w3,w4;
		//wire sum,carry;
			xor (w1,a,b),
			    (s,w1,c);
			and (w2,a,c),
				(w3,b,c),
				(w4,a,b);
			or (cout,w2,w3,w4);
		
	endmodule	