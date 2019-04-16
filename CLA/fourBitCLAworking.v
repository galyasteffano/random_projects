module cla_4bit(output [3:0]S,output Cout, PG,GG,input [3:0]A,B,input Cin);
	wire [3:0] G,P,C;
	wire g1,g2,g3,g4;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10;
	
	//generate   G= A&B 
		and (G[0],A[0],B[0]),	
			(G[1],A[1],B[1]),
			(G[2],A[2],B[2]),
			(G[3],A[3],B[3]);
	//propagate  P=A^B
		xor (P[0],A[0],B[0]),
		    (P[1],A[1],B[1]),
			(P[2],A[2],B[2]),
			(P[3],A[3],B[3]);
	
			
     or (C[0],Cin);
   /* assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) |             (P[2] & P[1] & P[0] & C[0]);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
    */

		and (w1,P[0],C[0]);    //C[0]
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
		or  (Cout,G[3],w7,w8,w9,w10);		
//SUM
	//	assign S=P^C;
	    xor (S[0],P[0],C[0]),
			(S[1],P[1],C[1]),
			(S[2],P[2],C[2]),
			(S[3],P[3],C[3]);  
//PROPAGATE
		and (PG,P[3],P[2],P[1],P[0]);
//GENERATE

	/*    and (g1,P[2],G[1]);
		and (g2, P[2],P[1],G[1]);
		and (g3,P[2],P[1],P[0],G[0]);
		or  (GG,G[2],g1,g2,g3); */
	
		and (g1,P[3],G[2]),
			(g2,P[3],P[2],G[1]),
			(g3,P[3],P[2],P[1],G[0]);
		or  (GG,G[3],g1,g2,g3);
		
endmodule		
			

module test_cla_4bit;
	//inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Cin;
	
	//outputs
	
	wire [3:0] S;
	wire Cout;
	wire PG;
	wire GG;
	
	cla_4bit cla  (.S(S), .Cout(Cout), .PG(PG), .GG(GG), .A(A),.B(B),.Cin(Cin));
	
	
	
	
	    initial begin
    // Initialize Inputs
    A = 0;  B = 0;  Cin = 0;
    // Wait 100 ns for global reset to finish
    #100;
        
    // Add stimulus here
 //  A=4'b0001;B=4'b0000;Cin=1'b0;
    #10 A=4'b100;B=4'b0011;Cin=1'b0;
    #10 A=4'b1101;B=4'b1010;Cin=1'b1;
    #10 A=4'b1110;B=4'b1001;Cin=1'b0;
    #10 A=4'b1111;B=4'b1010;Cin=1'b0;
    end 
 
    initial begin
 $monitor("time=",$time,, "A=%b B=%b Cin=%b : Sum=%b Cout=%b PG=%b GG=%b",A,B,Cin,S,Cout,PG,GG);
    end      
endmodule

/*	initial begin 
		A=0; B=0; Cin=0;
	
		#100;
	end
	
	initial begin
	 $monitor($time," A=%b, B=%b, Cin=%b, Sum=%b, Cout =%b P = %b ,G = %b",A,B,Cin,S,Cout,P,G);
	 $display($time," A=%b, B=%b, Cin=%b, Sum=%b, Cout =%b P = %b ,G = %b",A,B,Cin,S,Cout,P,G); 
			#100;
				#1 A=1; B=0; Cin=0;
			//	#1 a=6; b=9; cin=0;
			//	#1
			#100;

	  $display($time," A=%b, B=%b, Cin=%b, Sum=%b, Cout =%b P = %b ,G = %b",A,B,Cin,S,Cout,P,G);
	 end
	endmodule
	
	
	
	
	*/
	

		
		