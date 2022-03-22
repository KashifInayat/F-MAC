module pre_process_be #(parameter WIDTH = 32)(mx, s, d, t, q, n);
    
parameter group_cnt=(WIDTH>>2)+3; 

input [WIDTH-1:0] mx;
output wire [group_cnt - 1:0]s;
output wire [group_cnt - 1:0]d;
output wire [group_cnt - 1:0]t;
output wire [group_cnt - 1:0]q;
output wire [group_cnt - 1:0]n;

//Booth Encoding
   	    booth_encoder b_e0(.x({mx[2], mx[1], mx[0], 1'b0}), .single(s[0]), .double(d[0]), .triple(t[0]), .quad(q[0]), .neg(n[0]));
	    booth_encoder b_e1(.x({mx[5],mx[4], mx[3], mx[2]}), .single(s[1]), .double(d[1]), .triple(t[1]), .quad(q[1]), .neg(n[1]));
            booth_encoder b_e2(.x({mx[8],mx[7], mx[6], mx[5]}), .single(s[2]), .double(d[2]), .triple(t[2]), .quad(q[2]), .neg(n[2]));
            booth_encoder b_e3(.x({mx[11],mx[10], mx[9], mx[8]}), .single(s[3]), .double(d[3]), .triple(t[3]), .quad(q[3]), .neg(n[3]));
            booth_encoder b_e4(.x({mx[14],mx[13], mx[12], mx[11]}), .single(s[4]), .double(d[4]), .triple(t[4]), .quad(q[4]), .neg(n[4]));
	    booth_encoder b_e5(.x({mx[17],mx[16], mx[15], mx[14]}), .single(s[5]), .double(d[5]), .triple(t[5]), .quad(q[5]), .neg(n[5]));
            booth_encoder b_e6(.x({mx[20],mx[19], mx[18], mx[17]}), .single(s[6]), .double(d[6]), .triple(t[6]), .quad(q[6]), .neg(n[6]));
	    booth_encoder b_e7(.x({mx[23],mx[22], mx[21], mx[20]}), .single(s[7]), .double(d[7]), .triple(t[7]), .quad(q[7]), .neg(n[7]));
	    booth_encoder b_e8(.x({mx[26],mx[25], mx[24], mx[23]}), .single(s[8]), .double(d[8]), .triple(t[8]), .quad(q[8]), .neg(n[8]));
	    booth_encoder b_e9(.x({mx[29],mx[28], mx[27], mx[26]}), .single(s[9]), .double(d[9]), .triple(t[9]), .quad(q[9]), .neg(n[9]));
	    booth_encoder b_e10(.x({1'b0,mx[31], mx[30], mx[29]}), .single(s[10]), .double(d[10]), .triple(t[10]), .quad(q[10]), .neg(n[10]));
endmodule

/******************** Booth Encoder ********************/
module booth_encoder (x, single, double, triple, quad, neg);

input [3:0]x;

output single;

output  double;

output triple;

output  quad;

output neg;

wire w0;

wire w1;

wire w2;

wire w3;

wire w4;

wire w5;

assign neg=x[3];

assign w0=x[0]^x[1];

assign w1=x[1]^x[2];

assign w2=x[2]^x[3];

assign single=~((~w0)|w2);

assign double=~((~w1)|w0);

assign triple=~((~w2)|(~w0));

assign quad=~((~w2)|(w0|w1));

endmodule

