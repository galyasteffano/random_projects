
module testbench();
	wire[3:0] x,y,s;
	wire cin,cout;
		test_adder test (x,y,s,cin,cout);
		pfa adder (x,y,s,cin,cout);
endmodule

module test_adder(a,b,sum,cin,cout);
	input[3:0] sum;  //sum
	input cout;   	//carry out
	output[3:0] p,g	;	//a_in, b_in
	output c;			//carry_in
	reg[3:0] a,b;
	reg c;			//carry_in
	  initial
		begin
		    $monitor($time," a: %b, b: %b, p: %b, g: %b, sum: %b, Cin: %b, Cout: %b",a,b,p,g,sum,cin,cout);
		    $display($time," a: %b, b: %b, p: %b, g: %b, sum: %b, Cin: %b, Cout: %b",a,b,p,g,sum,cin,cout); 
			#10 a=0; b=0;cin=0;    //1
			#10 a=0;b=0;cin=1;    //2
			#10 a=0;b=1;cin=0;     //3
			#10 a=0;b=1;cin=1;	//4
			#10 a=1;b=0;cin=0;	//5
			#10 a=1;b=0;cin=1;	//6
			#10 a=1;b=1;cin=0;	//7
			#10 a=1;b=1;cin=1;	//8
				
		 $display($time," a: %b, b: %b, p: %b, g: %b, sum: %b, Cin: %b, Cout: %b",a,b,p,g,sum,cin,cout); 		
		//	$display($time," a=%d, b=%d, c=%b, s=%h, carry=%b ",a_in,b_in,cin,sum,cout);
		//	$display($time," a=%b, b=%b, c=%b, s=%b, carry=%b ",a_in,b_in,cin,sum,cout);	
		end
	endmodule


module pfa(output p,g,sum, input a,b,Cin);  //A one PFA. I need 16 of them5
	//wire w;
	//reg a,b,c;
	//wire sum,p,g;
	
	xor (w,a,b);     //repeated P. May need it may not. 
	and (g,a,b);  //Gi
	xor (p,a,b);   //Pi
	xor (sum,w,c);  //sum 
endmodule

module fourBitPFA(output P[3:0],G[3:0],sum[3:0],input A[3:0],B[3:0],Cin);
	
	wire p0,g0;
	wire b1,b2,b3;
	wire w,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
	wire c1,c2,c3,c4;
		pfa PFA0(P[0],G[0],C0,S[0],A[0],B[0]),
			PFA1(P[1],G[1],C0,S[1],A[1],B[1]),	
			PFA2(P[2],G[2],C0,S[2],A[2],B[2]),
			PFA3(P[3],G[3],C0,S[3],A[3],B[3]);
	    //propagate
        and (p0,P[3],P[2],P[1],P[0]);
		
		//GENERATE
		and (w,P[3],G[2]);
		and (w1,P[3],P[2],G[1]);
		and (w2,P[3],P[2],P[1],G[0]);
		or (w,w1,w2);
//CLA 
	
	
		and (w3,P[0],Cin);
		or (c1,G[0],w3);
		and (w4,P[1],G[0]);
		and (w5,P[1],P[0],Cin);
		or (c2,G[1],w4,w5);
		and (w6,P[2],G[1]);
		and (w7,P[2],P[1],G[0]);
		and (w8,P[2],P[1],P[0],Cin);
		or (c3,G[2],w6,w7,w8);
		and (w9,P[3],G[2]);
		and (w10,P[3],P[2],G[1]);
		and (w11,P[3],P[2],P[1],G[0]);
		and (w12,P[3],P[2],P[1],P[0],Cin);
		or(c4,w9,w10,w11,w12);
endmodule		
		
		
		
		
		
		
	









	

	
	
	
	