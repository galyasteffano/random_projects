	
	`timescale 1ns/1ns
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
	//	initial
	//		begin
	
		//	$monitor($time," a=%h, b=%h, c=%b, sum=%h, carry=%b ",a,b,cin,s,cout);
		//	$display($time," a=%h, b=%h, c=%h, sum=%h, carry=%b ",a,b,cin,s,cout);
	
				integer i,file ;
	            initial begin 
				file=$fopen("rca.txt");
   
				$fwrite(file,$time," a=%d, b=%d, c=%b, sum=%d, carry=%b\n ",a,b,cin,s,cout);
	
				for(i=0;i<5000;i=i+1)
				begin
	
				#10 a=$urandom%30000;b=$urandom%30000;cin=0;
				$fwrite(file,$time,$time," a=%d, b=%d, c=%b, sum=%d, carry=%b\n ",a,b,cin,s,cout);
			end
			$finish	;
//	end
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
	
			xor #1 (w1,a,b),
			       (s,w1,c);
			and #1 (w2,a,c),
				   (w3,b,c),
				   (w4,a,b);
			or  #1 (cout,w2,w3,w4);
		
	endmodule	