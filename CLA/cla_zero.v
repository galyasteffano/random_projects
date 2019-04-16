module cla_4bit(output [15:0] S,output Cout, PG,GG,input [15:0]A,B,input Cin);
	wire [15:0] G,P,C;
	wire g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23;
	wire v,v1,v2;
	//generate   G= A&B 
		and (G[0],A[0],B[0]),	
			(G[1],A[1],B[1]),
			(G[2],A[2],B[2]),
			(G[3],A[3],B[3]),
			
			(G[4],A[4],B[4]),	
			(G[5],A[5],B[5]),
			(G[6],A[6],B[6]),
			(G[7],A[7],B[7]),
			
			(G[8],A[8],B[8]),	
			(G[9],A[9],B[9]),
			(G[10],A[10],B[10]),
			(G[11],A[11],B[11]),
			
			(G[12],A[12],B[12]),	
			(G[13],A[13],B[13]),
			(G[14],A[14],B[14]),
			(G[15],A[15],B[15]);
	//propagate  P=A^B
		xor (P[0],A[0],B[0]),
		    (P[1],A[1],B[1]),
			(P[2],A[2],B[2]),
			(P[3],A[3],B[3]),
			
			(P[4],A[4],B[4]),
		    (P[5],A[5],B[5]),
			(P[6],A[6],B[6]),
			(P[7],A[7],B[7]),
			
			(P[8],A[8],B[8]),
		    (P[9],A[9],B[9]),
			(P[10],A[10],B[10]),
			(P[11],A[11],B[11]),
			
			(P[12],A[12],B[12]),
		    (P[13],A[13],B[13]),
			(P[14],A[14],B[14]),
			(P[15],A[15],B[15]);
	
			
   

		 or (C[0],Cin);          //C0
		and (w1,P[0],C[0]);    
		or  (C[1],w1,G[0]);
							
		and	(w2,P[1],G[0]),		 
			(w3,P[1],P[0],C[0]);
		or (C[2],G[1],w2,w3);		
			
		and (w4, P[2],G[1]),
			(w5,P[2],P[1],G[0]),
			(w6,P[2],P[1],P[0],C[0]);
		or  (C[3],G[2],w4,w5,w6);	

		and (w7,P[3],G[2]),
			(w8,P[3],P[2],G[1]),
			(w9,P[3],P[2],P[1],G[0]),
			(w10,P[3],P[2],P[1],P[0],C[0]);
		or  (C[4],G[3],w7,w8,w9,w10);	

		and (w12,P[4],C[4]);
		or  (C[5],G[4],w12);	
		
		and (w13,P[5],C[5]);
		or  (C[6],G[5],w13);
		
		and (w14,P[6],C[6]);
		or  (C[7],G[6],w14);
		
		and (w15,P[7],C[7]);
		or  (C[8],G[7],w15);
		
		and (w16,P[8],C[8]);
		or  (C[9],G[8],w16);	
		
		and (w17,P[9],C[9]);
		or  (C[10],G[9],w17);
		
		and (w18,P[10],C[10]);
		or  (C[11],G[10],w18);
		
		and (w19,P[11],C[11]);
		or  (C[12],G[11],w19);
		
		and (w20,P[12],C[12]);
		or  (C[13],G[12],w20);	
		
		and (w21,P[13],C[13]);
		or  (C[14],G[13],w21);	
		
		and (w22,P[14],C[14]);
		or  (C[15],G[14],w22);

	    and (w23,P[15],C[15]);
		or  (Cout,G[15],w23);

			
//SUM
	//	assign S=P^C;
	    xor (S[0],P[0],C[0]),
			(S[1],P[1],C[1]),
			(S[2],P[2],C[2]),
			(S[3],P[3],C[3]),
			(S[4],P[4],C[4]),
			(S[5],P[5],C[5]),
			(S[6],P[6],C[6]),
			(S[7],P[7],C[7]),
			(S[8],P[8],C[8]),
			(S[9],P[9],C[9]),
			(S[10],P[10],C[10]),
			(S[11],P[11],C[11]),
			(S[12],P[12],C[12]),
			(S[13],P[13],C[13]),
			(S[14],P[14],C[14]),
			(S[15],P[15],C[15]);	

			
//PROPAGATE
		and (v,P[3],P[2],P[1],P[0]),
			(v1,P[7],P[6],P[5],P[4],v),
			(v2,P[11],P[10],P[9],P[8],v1),
			(PG,P[15],P[14],P[13],P[12],v2);
			
//GENERATE



	
		and (g1,P[3],G[2]),
			(g2,P[3],P[2],G[1]),
			(g3,P[3],P[2],P[1],G[0]);
		or  (g4,G[3],g1,g2,g3);
		
		and (g5,P[7],G[6]),
			(g6,P[7],P[6],G[5]),
			(g7,P[7],P[6],P[5],G[4]);
		or  (g8,G[7],g5,g6,g7,g4);
		
		and (g9,P[11],G[10]),
			(g10,P[11],P[10],G[9]),
			(g11,P[11],P[10],P[9],G[8]);
		or  (g12,G[11],g9,g10,g11,g8);
		
		and (g13,P[15],G[14]),
			(g14,P[15],P[14],G[13]),
			(g15,P[15],P[14],P[13],G[12]);
		or  (GG,G[15],g13,g14,g15,g12);
		
	
endmodule		
			

 module test_cla_4bit;
	//inputs
	reg [15:0] A;
	reg [15:0] B;
	reg Cin;
	
	//outputs
	
	wire [15:0] S;
	wire Cout;
	wire PG;
	wire GG;
	
	cla_4bit cla  (.S(S), .Cout(Cout), .PG(PG), .GG(GG), .A(A),.B(B),.Cin(Cin));
	initial begin
			$monitor($time," A=%h B=%h Cin=%b : Sum=%h Cout=%b PG=%b GG=%b",A,B,Cin,S,Cout,PG,GG);
			$display($time," A=%b B=%h Cin=%b : Sum=%h Cout=%b PG=%b GG=%b",A,B,Cin,S,Cout,PG,GG);
		
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
			
			
			  /*** testing 2^15 ->2^12 *  **/
				#20 a=53247;b=8192;cin=0; 
			    #20 a=26479;b=4158; cin=0;  //upper
				#20 a=40960;b=5;cin=0;
			//	#20 a=24576;b=6288;cin=0; 	//lower
			    #20	
			
			$display($time," A=%h B=%h Cin=%b : Sum=%h Cout=%b PG=%b GG=%b",A,B,Cin,S,Cout,PG,GG);
end
endmodule
	
	