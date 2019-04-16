
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
module adder (input [3:0] A,B,input Cin,output[3:0] sum,output carry);	
		    //may be wire??
		
		wire Cin;
		wire P0,P1,P2,P3,G0,G1,G2,G3;
		wire C1,C2,C3,C4;
		wire v1,v2,v3,v4,v5,v6,v7,v8,v9,v10;
		wire w1,w2,w3;
//  4 PFAS please
			
		pfa PFA0(A[0],B[0],Cin,P0,G0,sum[0]),  //C[1]
			PFA1(A[1],B[1],C1,P1,G1,sum[1]),  
			PFA2(A[2],B[2],C2,P2,G2,sum[2]),
			PFA3(A[3],B[3],C3,P3,G3,sum[3]);
			
// now 	P=A xor B		
		
		and (P0,P1,P2,P3);
//G		
		and (w1,P3,G2),
			(w2,P3,P2,G1),
			(w3,P3,P2,P1,G0);
		or  (G3,w1,w2,w3);

//Carry generator
      
		
		and (v1,P0,Cin);    //C[0]
		or  (C1,v1,G1);
		
		and	(v2,P1,G0),		
			(v3,P1,P0,Cin);
		or  (C2,v2,v3,G1);
		
		and (v4, P2,G1),
			(v5,P2,P1,G0),
			(v6,P3,P2,P1,Cin);
		or  (C3,v4,v5,v6,G2);	
		
        and (v7,P3,G2),
			(v8,P3,P2,G1),
			(v9,P3,P2,P1,G0),
			(v10,P3,P2,P1,P0,Cin);
		or  (C3,G3,v7,v8,v9,v10);	
endmodule

module testAdder(a,b,carry,p,g,sum,cout);
	
	input[3:0] sum;
	input cout;
	output[3:0] a,b;
	output carry;
	reg[3:0] a,b;
	input  p,g;
	reg cin;
	initial
		begin
		$monitor($time,"a =%b, b =%b, cin =%b,p: %b,g: %b sum =%b, cout =%b",a,b,carry,p,g,sum,cout);
		$display($time,"a =%b, b =%b, cin =%b,p: %b,g: %b sum =%b, cout =%b",a,b,carry,p,g,sum,cout);
		#20 a=2; b=3; cin=0;
		#20 a=1; b=7; cin=0;
		#20	a=4;b=10;  cin=0;
		#20	a=1;b=2;cin=0;
		
		
		$display($time,"a =%b, b =%b, cin =%b,p: %b,g: %b sum =%b, cout =%b",a,b,carry,p,g,sum,cout);
		end
endmodule	

module testbench();

	wire [3:0] a,b,sum;
	wire carry;
	wire c;
	wire  p,g;
	testAdder test (a,b,c,p,g,sum,carry);
	adder cla (a,b,c,sum,carry);

endmodule