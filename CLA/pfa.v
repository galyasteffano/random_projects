 module pfa;  //A one PFA. I need 16 of them5
	wire w;
	reg a,b,c;
	wire sum,p,g;
	
	xor (w,a,b);      
	and (g,a,b);  //Gi
	xor (p,a,b);   //Pi
	xor (sum,w,c);  
	
	
	
	
	
	initial begin
		$monitor($time,"    a: %b, b: %b, p: %b, g: %b, c: %b,sum: %b ",a,b,p,g,c,sum);
		$display($time,"    a: %b, b: %b, p: %b, g: %b, c: %b,sum: %b ",a,b,p,g,c,sum);
		#0 a=0; b=0;c=0;    //1
		#10 a=0;b=0;c=1;    //2
		#10 a=0;b=1;c=0;     //3
		#10 a=0;b=1;c=1;	//4
		#10 a=1;b=0;c=0;	//5
		#10 a=1;b=0;c=1;	//6
		#10 a=1;b=1;c=0;	//7
		#10 a=1;b=1;c=1;	//8
	
	end	
endmodule		