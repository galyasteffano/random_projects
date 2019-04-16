 module full_adder;
	wire s,w1,w2,w3,w4;
	reg a,b,c;
	wire carry;
	
	xor (w1,a,b);
	xor (s,w1,c);
	and (w2,a,c);
	and (w3,b,c);
	and (w4,a,b);
	or (carry,w2,w3,w4);
	
	initial begin
		$monitor($time," a =%b, b =%b, c =%b,carry =%b,s =%b",a,b,c,carry,s);
		$display($time," a =%b, b =%b, c =%b,carry =%b,s =%b ", a,b,c,carry,s);
		#10 a=0; b=0;c=0;    //1
		#10 a=0;b=0;c=1;    //2
		#10 a=0;b=1;c=0;     //3
		#10 a=0;b=1;c=1;	//4
		#10 a=1;b=0;c=0;	//5
		#10 a=1;b=0;c=1;	//6
		#10 a=1;b=1;c=0;	//7
		#10 a=1;b=1;c=1;	//8
	
	end	
endmodule				