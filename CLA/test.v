
module pfa(input a,b,c,output sum,p,g);  //A one PFA. I need 16 of them5
	//wire w;
	//reg a,b,c;
	//wire sum,p,g;
	//input a,b,c;
	//output sum,p,g;
	
	xor (w,a,b);     //repeated P. May need it may not. 
	and (g,a,b);  //Gi
	xor (p,a,b);   //Pi
	xor (sum,w,c);  //sum 
endmodule
                //input	   output	
module adder (input [3:0] A,B,output[3:0] sum);	
		    //may be wire??
		
		wire Cin;
		wire[3:0] P,G;
		wire C1,C2,C3,C4;
		wire v1,v2,v3,v4,v5,v6,v7,v8,v9,v10;
		wire w1,w2,w3;
//  4 PFAS please
			
		pfa PFA0(A[0],B[0],Cin,P[0],G[0],sum[0]),  //C[1]
			PFA1(A[1],B[1],C1,P[1],G[1],sum[1]),  
			PFA2(A[2],B[2],C2,P[2],G[2],sum[2]),
			PFA3(A[3],B[3],C3,P[3],G[3],sum[3]);
			
// now 	P=A xor B		
		
		and (P[0],P[1],P[2],P[3]);
//G		
		and (w1,P[3],G[2]),
			(w2,P[3],P[2],G[1]),
			(w3,P[3],P[2],P[1],G[0]);
		or  (G[3],w1,w2,w3);

//Carry generator
      
		
		and (v1,P[0],Cin);    //C[0]
		or  (C1,v1,G[0]);
		and	(v2,P[1],G[0]),		
			(v3,P[1],P[0],Cin);
		or  (C2,v2,v3,G[1]);
		
		and (v4, P[2],G[1]),
			(v5,P[2],P[1],G[0]),
			(v6,P[3],P[2],P[1],Cin);
		or  (C3,v4,v5,v6,G[2]);	
		
        and (v7,P[3],G[2]),
			(v8,P[3],P[2],G[1]),
			(v9,P[3],P[2],P[1],G[0]),
			(v10,P[3],P[2],P[1],P[0],Cin);
		or  (C3,G[3],v7,v8,v9,v10);	
	

endmodule

module testbench();
	wire [3:0] x,y,s;
	wire cin;
	
	
	
	
	
	
	





