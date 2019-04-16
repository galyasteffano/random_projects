	/*** zero gate delay ***/
	
	module testbench();
	
		wire[3:0] x,y,s;
		wire cin,cout;
			test_adder test (x,y,s,cout,cin);
			sixteen_bit_adder adder (x,y,s,cout,cin);
	endmodule
	
	
	
		module test_adder(a,b,s,cout,cin);
			input[3:0] s;  //sum
			input cout;   	//carry out
			output[3:0] a,b;	//a_in, b_in
			output cin;			//carry_in
			reg[3:0] a,b;
			reg cin;			//carry_in
		initial
			begin
		    $monitor($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a,b,cin,s,cout);
		    $display($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a,b,cin,s,cout); 
	
				#1 a=1; b=4; cin=0;
			//	#1 a=6; b=9; cin=0;
				#1

		   $display($time," a=%b, b=%b, c=%b, sum=%b, carry=%b ",a,b,cin,s,cout);
			end
	endmodule
	
	
	
	
	module fourBitAdder (input[3:0]x,y,input Cin,output P,G,output[3:0] sum);
		wire[3:0] c;
		wire [3:0] P,G;
		full_adder FA0(x[0],y[0],Cin,s[0],P[0],G[0]),
				   FA1(x[1],y[1],c[1],s[1],P[1],G[1]),
				   FA2(x[2],y[2],c[2],s[2],P[2],G[2]),
				   FA3(x[3],y[3],c[3],s[3],P[3],G[3]);
	
	
	
	module cla (input p,g,output carry[3:1],cout)
		wire [3:1] C;
		wire[3:0] P,G;
	
			
	//Carry generator
      
		// now 	P=A xor B		
		
		and (P[0],P[1],P[2],P[3]);
//G		
		and (w1,P[3],G[2]),
			(w2,P[3],P[2],G[1]),
			(w3,P[3],P[2],P[1],G[0]);
		or  (cout,G[3],w1,w2,w3);
	

	
		and (v1,P[0],Cin);    //C[0]
		or  (cout,c[1],v1,G[0]);
		    
		and	(v2,P[1],G[0]),		
			(v3,P[1],P[0],C[0]);
		or  (cout,c[2],v2,v3,G[1]);
		
		and (v4, P[2],G[1]),
			(v5,P[2],P[1],G[0]),
			(v6,P[3],P[2],P[1],C[0]);
		or  (cout,c[3],v4,v5,v6,G[2]);	
		
        and (v7,P[3],G[2]),
			(v8,P[3],P[2],G[1]),
			(v9,P[3],P[2],P[1],G[0]),
			(v10,P[3],P[2],P[1],P[0],C[0]);
		or  (cout,c[3],G[3],v7,v8,v9,v10);	
	endmodule
	
	/*** full adder ***/
	module full_adder(a,b,c,s,p,g);
		output s,p,g;
		input a,b,c;
		
		xor (w,a,b);     //repeated P. May need it may not. 
	    and (g,a,b);  //Gi
		xor (p,a,b);   //Pi
		xor (sum,w,c);  //sum 
		
	endmodule	