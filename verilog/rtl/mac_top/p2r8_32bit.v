module mb32 #(parameter WIDTH = 32)(s, d, t, q, n, my, tmy, CLK,RST, product);
parameter group_cnt=(WIDTH>>2)+3; 
input wire [group_cnt-1:0] s;
input wire [group_cnt-1:0] d;
input wire [group_cnt-1:0] t;
input wire [group_cnt-1:0] q;
input wire [group_cnt-1:0] n;
input wire [WIDTH-1:0] my;
input  wire [WIDTH+1:0] tmy;
input wire CLK;
input wire RST;
output wire [(WIDTH*2)-1:0] product;
wire [WIDTH+1:0] epp2d[0:group_cnt - 1];
wire [WIDTH+2:0] fpp0;
wire [WIDTH+2:0] fpp1;
wire [WIDTH+2:0] fpp2;
wire [WIDTH+2:0] fpp3;
wire [WIDTH+2:0] fpp4;
wire [WIDTH+2:0] fpp5;
wire [WIDTH+2:0] fpp6;
wire [WIDTH+2:0] fpp7;
wire [WIDTH+2:0] fpp8;
wire [WIDTH+2:0] fpp9;
wire [WIDTH+1:0] fpp10;

genvar i, j;
generate
    for (j = 0; j < group_cnt; j = j + 1) begin: b_selector 
		  booth_sel bs(.y2(my[0]),.y1(1'b0),.y0(1'b0), .ty(tmy[0]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][0]));
		  booth_sel bs0(.y2(my[1]), .y1(my[0]),.y0(1'b0), .ty(tmy[1]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][1]));
		  booth_sel bs1(.y2(my[2]),.y1(my[1]),.y0(my[0]), .ty(tmy[2]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][2]));
		  booth_sel bs2(.y2(my[3]),.y1(my[2]),.y0(my[1]), .ty(tmy[3]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][3]));
                  booth_sel bs3(.y2(my[4]),.y1(my[3]),.y0(my[2]), .ty(tmy[4]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][4]));
                  booth_sel bs4(.y2(my[5]),.y1(my[4]),.y0(my[3]), .ty(tmy[5]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][5]));
                  booth_sel bs5(.y2(my[6]),.y1(my[5]),.y0(my[4]), .ty(tmy[6]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][6]));
                  booth_sel bs6(.y2(my[7]),.y1(my[6]),.y0(my[5]), .ty(tmy[7]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][7]));
                  booth_sel bs7(.y2(my[8]),.y1(my[7]),.y0(my[6]), .ty(tmy[8]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][8]));
                  booth_sel bs8(.y2(my[9]),.y1(my[8]),.y0(my[7]), .ty(tmy[9]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][9]));
                  booth_sel bs9(.y2(my[10]),.y1(my[9]),.y0(my[8]), .ty(tmy[10]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][10]));
                  booth_sel bs10(.y2(my[11]),.y1(my[10]),.y0(my[9]), .ty(tmy[11]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][11]));
                  booth_sel bs11(.y2(my[12]),.y1(my[11]),.y0(my[10]), .ty(tmy[12]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][12]));
                  booth_sel bs12(.y2(my[13]),.y1(my[12]),.y0(my[11]), .ty(tmy[13]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][13]));
                  booth_sel bs13(.y2(my[14]),.y1(my[13]),.y0(my[12]), .ty(tmy[14]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][14]));
                  booth_sel bs14(.y2(my[15]), .y1(my[14]), .y0(my[13]), .ty(tmy[15]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][15]));
                  booth_sel bs15(.y2(my[16]), .y1(my[15]), .y0(my[14]), .ty(tmy[16]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][16]));
                  booth_sel bs16(.y2(my[17]), .y1(my[16]), .y0(my[15]), .ty(tmy[17]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][17]));
                  booth_sel bs17(.y2(my[18]), .y1(my[17]), .y0(my[16]), .ty(tmy[18]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][18]));
                  booth_sel bs18(.y2(my[19]), .y1(my[18]), .y0(my[17]), .ty(tmy[19]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][19]));
                  booth_sel bs19(.y2(my[20]), .y1(my[19]), .y0(my[18]), .ty(tmy[20]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][20]));
                  booth_sel bs20(.y2(my[21]), .y1(my[20]), .y0(my[19]), .ty(tmy[21]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][21]));
                  booth_sel bs21(.y2(my[22]), .y1(my[21]), .y0(my[20]), .ty(tmy[22]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][22]));
                  booth_sel bs22(.y2(my[23]), .y1(my[22]), .y0(my[21]), .ty(tmy[23]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][23]));
                  booth_sel bs23(.y2(my[24]), .y1(my[23]), .y0(my[22]), .ty(tmy[24]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][24]));
                  booth_sel bs24(.y2(my[25]), .y1(my[24]), .y0(my[23]), .ty(tmy[25]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][25]));
                  booth_sel bs25(.y2(my[26]), .y1(my[25]), .y0(my[24]), .ty(tmy[26]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][26]));
                  booth_sel bs26(.y2(my[27]), .y1(my[26]), .y0(my[25]), .ty(tmy[27]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][27]));
                  booth_sel bs27(.y2(my[28]), .y1(my[27]), .y0(my[26]), .ty(tmy[28]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][28]));
                  booth_sel bs28(.y2(my[29]), .y1(my[28]), .y0(my[27]), .ty(tmy[29]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][29]));
                  booth_sel bs29(.y2(my[30]), .y1(my[29]), .y0(my[28]), .ty(tmy[30]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][30]));
                  booth_sel bs30(.y2(my[31]), .y1(my[30]), .y0(my[29]), .ty(tmy[31]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][31]));
                  booth_sel bs31(.y2(1'b0), .y1(my[31]), .y0(my[30]), .ty(tmy[32]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][32]));
                  booth_sel bs32(.y2(1'b0), .y1(1'b0), .y0(my[31]), .ty(tmy[33]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][33]));
                  //booth_sel bs14(.y2(1'b0), .y1(1'b0), .y0(my[13]), .ty(tmy[15]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][15]));
                  //booth_sel bs15(.y2(1'b0), .y1(my[15]),.y0(my[14]), .ty(tmy[16]), .single(s[j]), .double(d[j]), .triple(t[j]), .quad(q[j]), .neg(n[j]), .p(epp2d[j][16]));   
	end
endgenerate    


//Partial Products
assign fpp0 = {~n[0] , epp2d[0]};
assign fpp1 = {~n[1] , epp2d[1]};
assign fpp2 = {~n[2] , epp2d[2]};
assign fpp3 = {~n[3] , epp2d[3]};
assign fpp4 = {~n[4] , epp2d[4]};
assign fpp5 = {~n[5] , epp2d[5]};
assign fpp6 = {~n[6] , epp2d[6]};
assign fpp7 = {~n[7] , epp2d[7]};
assign fpp8 = {~n[8] , epp2d[8]};
assign fpp9 = {~n[9] , epp2d[9]};
assign fpp10 = {epp2d [10][33:0]};

//Correction vector
wire [63:0]cv= {30'h36db6db7, 4'b0000, 2'b00, n[9], 2'b00, n[8], 2'b00, n[7], 2'b00, n[6], 2'b00, n[5], 2'b00, n[4], 2'b00, n[3], 2'b00, n[2], 2'b00, n[1], 2'b00, n[0]};

/*wire [63:0] cfpp1;
assign cfpp1= fpp0+{fpp1,3'b000}+{fpp2,6'b000000}+{fpp3,9'b000000000}+{fpp4,12'b000000000000}+{fpp5,15'b000000000000000}+{fpp6,18'b000000000000000000}+{fpp7,21'b000000000000000000000}+{fpp8,24'b000000000000000000000000}+{fpp9,27'b000000000000000000000000000}+{fpp10,30'b000000000000000000000000000000}+cv;
assign product=cfpp1;
*/

//******************** STAGE 1 of Wallace tree ********************//
wire has000;
wire hac000;
wire has001;
wire hac001;
wire has002;  
wire hac002;

wire ahas000;
wire ahac000;
wire ahas001;
wire ahac001;
wire ahas002;
wire ahac002;

wire has010;
wire hac010;
wire has011;
wire hac011;
wire has012;  
wire hac012;

wire ahas010;
wire ahac010;
wire ahas011;
wire ahac011;
wire ahas012;
wire ahac012;

wire has020;
wire hac020;
wire has021;
wire hac021;
wire has022;
wire hac022;

wire ahas020;
wire ahac020;
wire ahas021;
wire ahac021;
wire ahas022;
wire ahac022;

wire has030;
wire hac030;
wire has031;
wire hac031;
wire has032;
wire hac032;

wire ahas030;
wire ahac030;
wire ahas031;
wire ahac031;
wire ahas032;
wire ahac032;

wire [31:0] fas0;
wire [31:0] fac0; 

wire [28:0] fas1;
wire [28:0] fac1; 

wire [28:0] fas2;
wire [28:0] fac2;

wire [28:0] fas3;
wire [28:0] fac3;

wire [(WIDTH*2)-1:0] st00;
wire [37:0] st01;
wire [40:0] st02;
wire [34:0] st03;
wire [40:0] st04;
wire [34:0] st05;
wire [39:0] st06;
wire [34:0] st07;

HALF_ADDER ha000(.a(cv[0]), .b(fpp0[0]) , .sum(has000), .cout(hac000));
HALF_ADDER ha001(.a(cv[1]), .b(fpp0[1]) , .sum(has001), .cout(hac001));
HALF_ADDER ha002(.a(cv[2]), .b(fpp0[2]) , .sum(has002), .cout(hac002));

HALF_ADDER aha000(.a(cv[35]), .b(fpp1[32]) , .sum(ahas000), .cout(ahac000));
HALF_ADDER aha001(.a(cv[36]), .b(fpp1[33]) , .sum(ahas001), .cout(ahac001));
HALF_ADDER aha002(.a(cv[37]), .b(fpp1[34]) , .sum(ahas002), .cout(ahac002));

generate
	for (i = 0; i < 32; i = i + 1) begin:	for_s0 
		FULL_ADDER fa000(.a(cv[i + 3]), .b(fpp0[i + 3]), .cin(fpp1[i]), .sum(fas0[i]), .cout(fac0[i]));
	end
endgenerate

assign st00 = {cv[63:38], ahas002, ahas001, ahas000, fas0, has002, has001, has000};	
assign st01 = {ahac002, ahac001, ahac000, fac0, hac002, hac001, hac000};				 

HALF_ADDER ha010(.a(fpp2[3]), .b(fpp3[0]) , .sum(has010), .cout(hac010));
HALF_ADDER ha011(.a(fpp2[4]), .b(fpp3[1]) , .sum(has011), .cout(hac011));
HALF_ADDER ha012(.a(fpp2[5]), .b(fpp3[2]) , .sum(has012), .cout(hac012));

HALF_ADDER aha010(.a(fpp3[32]), .b(fpp4[29]) , .sum(ahas010), .cout(ahac010));
HALF_ADDER aha011(.a(fpp3[33]), .b(fpp4[30]) , .sum(ahas011), .cout(ahac011));
HALF_ADDER aha012(.a(fpp3[34]), .b(fpp4[31]) , .sum(ahas012), .cout(ahac012));

generate
	for (i = 0; i < 29; i = i + 1) begin:	for_s1 
		FULL_ADDER fa010(.a(fpp2[i + 6]), .b(fpp3[i + 3]), .cin(fpp4[i]), .sum(fas1[i]), .cout(fac1[i]));
	end
endgenerate

assign st02 = {fpp4[34:32],ahas012,ahas011,ahas010,fas1, has012, has011, has010, fpp2[2:0]};	
assign st03 = {ahac012, ahac011, ahac010, fac1, hac012, hac011, hac010};				 

HALF_ADDER ha020(.a(fpp5[3]), .b(fpp6[0]) , .sum(has020), .cout(hac020));
HALF_ADDER ha021(.a(fpp5[4]), .b(fpp6[1]) , .sum(has021), .cout(hac021));
HALF_ADDER ha022(.a(fpp5[5]), .b(fpp6[2]) , .sum(has022), .cout(hac022));

HALF_ADDER aha020(.a(fpp6[32]), .b(fpp7[29]) , .sum(ahas020), .cout(ahac020));
HALF_ADDER aha021(.a(fpp6[33]), .b(fpp7[30]) , .sum(ahas021), .cout(ahac021));
HALF_ADDER aha022(.a(fpp6[34]), .b(fpp7[31]) , .sum(ahas022), .cout(ahac022));

generate
        for (i = 0; i < 29; i = i + 1) begin:   for_s2
                FULL_ADDER fa010(.a(fpp5[i + 6]), .b(fpp6[i + 3]), .cin(fpp7[i]), .sum(fas2[i]), .cout(fac2[i]));
        end
endgenerate

assign st04 = {fpp7[34:32],ahas022,ahas021,ahas020,fas2, has022, has021, has020, fpp5[2:0]};
assign st05 = {ahac022, ahac021, ahac020, fac2, hac022, hac021, hac020};

HALF_ADDER ha030(.a(fpp8[3]), .b(fpp9[0]) , .sum(has030), .cout(hac030));
HALF_ADDER ha031(.a(fpp8[4]), .b(fpp9[1]) , .sum(has031), .cout(hac031));
HALF_ADDER ha032(.a(fpp8[5]), .b(fpp9[2]) , .sum(has032), .cout(hac032));

HALF_ADDER aha030(.a(fpp9[32]), .b(fpp10[29]) , .sum(ahas030), .cout(ahac030));
HALF_ADDER aha031(.a(fpp9[33]), .b(fpp10[30]) , .sum(ahas031), .cout(ahac031));
HALF_ADDER aha032(.a(fpp9[34]), .b(fpp10[31]) , .sum(ahas032), .cout(ahac032));

generate
        for (i = 0; i < 29; i = i + 1) begin:   for_s3
                FULL_ADDER fa010(.a(fpp8[i + 6]), .b(fpp9[i + 3]), .cin(fpp10[i]), .sum(fas3[i]), .cout(fac3[i]));
        end
endgenerate

assign st06 = {fpp10[33:32],ahas032,ahas031,ahas030,fas3, has032, has031, has030, fpp8[2:0]};
assign st07 = {ahac032, ahac031, ahac030, fac3, hac032, hac031, hac030};

/*wire [63:0] cfpp1;
assign cfpp1= st00+{st01,1'b0}+{st02,6'b000000}+{st03,10'b0000000000}+{st04,15'b000000000000000}+{st05,19'b0000000000000000000}+{st06,24'b000000000000000000000000}+{st07,28'b0000000000000000000000000000};
assign product=cfpp1; */

//******************** STAGE 2 of Wallace tree********************
wire has100;
wire has101;
wire has102;
wire has103;
wire has104;

wire hac100;
wire hac101;
wire hac102;
wire hac103;
wire hac104;

wire ahas100;
wire ahas101;
wire ahas102;
wire ahas103;
wire ahas104;
wire ahas105;
wire ahas106;
wire ahas107;

wire ahac100;
wire ahac101;
wire ahac102;
wire ahac103;
wire ahac104;
wire ahac105;
wire ahac106;
wire ahac107;

wire has110;
wire has111;
wire has112;
wire has113;

wire hac110;
wire hac111;
wire hac112;
wire hac113;

wire ahas110;
wire ahas111;
wire ahas112;
wire ahas113;
wire ahas114;
wire ahas115;
wire ahas116;
wire ahas117;
wire ahas118;


wire ahac110;
wire ahac111;
wire ahac112;
wire ahac113;
wire ahac114;
wire ahac115;
wire ahac116;
wire ahac117;
wire ahac118;


wire [32:0] fas10;
wire [32:0] fac10;

wire [25:0] fas11;
wire [25:0] fac11;

wire [(WIDTH*2)-1:0] st10;
wire [45:0] st11;
wire [45:0] st12;
wire [38:0] st13;
wire [39:0] st14;
wire [34:0] st15;

HALF_ADDER ha100(.a(st00[1]), .b(st01[0]) , .sum(has100), .cout(hac100));
HALF_ADDER ha101(.a(st00[2]), .b(st01[1]) , .sum(has101), .cout(hac101));
HALF_ADDER ha102(.a(st00[3]), .b(st01[2]) , .sum(has102), .cout(hac102));
HALF_ADDER ha103(.a(st00[4]), .b(st01[3]) , .sum(has103), .cout(hac103));
HALF_ADDER ha104(.a(st00[5]), .b(st01[4]) , .sum(has104), .cout(hac104));

HALF_ADDER aha100(.a(st00[39]), .b(st02[33]) , .sum(ahas100), .cout(ahac100));
HALF_ADDER aha101(.a(st00[40]), .b(st02[34]) , .sum(ahas101), .cout(ahac101));
HALF_ADDER aha102(.a(st00[41]), .b(st02[35]) , .sum(ahas102), .cout(ahac102));
HALF_ADDER aha103(.a(st00[42]), .b(st02[36]) , .sum(ahas103), .cout(ahac103));
HALF_ADDER aha104(.a(st00[43]), .b(st02[37]) , .sum(ahas104), .cout(ahac104));
HALF_ADDER aha105(.a(st00[44]), .b(st02[38]) , .sum(ahas105), .cout(ahac105));
HALF_ADDER aha106(.a(st00[45]), .b(st02[39]) , .sum(ahas106), .cout(ahac106));
HALF_ADDER aha107(.a(st00[46]), .b(st02[40]) , .sum(ahas107), .cout(ahac107));

generate
	for (i = 0; i < 33; i = i + 1) begin:	for_s10
		FULL_ADDER fa10(.a(st00[i + 6]), .b(st01[i+5 ]), .cin(st02[i]), .sum(fas10[i]), .cout(fac10[i]));
	end
endgenerate

assign st10 = {st00[63:47],ahas107, ahas106, ahas105, ahas104, ahas103, ahas102, ahas101,  ahas100, fas10, has104, has103, has102, has101, has100, st00[0]};	
assign st11 = { ahac107, ahac106, ahac105, ahac104, ahac103, ahac102, ahac101,  ahac100, fac10, hac104 , hac103, hac102, hac101, hac100};						

HALF_ADDER ha110(.a(st03[5]), .b(st04[0]) , .sum(has110), .cout(hac110));
HALF_ADDER ha111(.a(st03[6]), .b(st04[1]) , .sum(has111), .cout(hac111));
HALF_ADDER ha112(.a(st03[7]), .b(st04[2]) , .sum(has112), .cout(hac112));
HALF_ADDER ha113(.a(st03[8]), .b(st04[3]) , .sum(has113), .cout(hac113));

HALF_ADDER aha110(.a(st04[30]), .b(st05[26]) , .sum(ahas110), .cout(ahac110));
HALF_ADDER aha111(.a(st04[31]), .b(st05[27]) , .sum(ahas111), .cout(ahac111));
HALF_ADDER aha112(.a(st04[32]), .b(st05[28]) , .sum(ahas112), .cout(ahac112));
HALF_ADDER aha113(.a(st04[33]), .b(st05[29]) , .sum(ahas113), .cout(ahac113));
HALF_ADDER aha114(.a(st04[34]), .b(st05[30]) , .sum(ahas114), .cout(ahac114));
HALF_ADDER aha115(.a(st04[35]), .b(st05[31]) , .sum(ahas115), .cout(ahac115));
HALF_ADDER aha116(.a(st04[36]), .b(st05[32]) , .sum(ahas116), .cout(ahac116));
HALF_ADDER aha117(.a(st04[37]), .b(st05[33]) , .sum(ahas117), .cout(ahac117));
HALF_ADDER aha118(.a(st04[38]), .b(st05[34]) , .sum(ahas118), .cout(ahac118));


generate
        for (i = 0; i < 26; i = i + 1) begin:   for_s11
                FULL_ADDER fa11(.a(st03[i + 9]), .b(st04[i+4]), .cin(st05[i]), .sum(fas11[i]), .cout(fac11[i]));
        end
endgenerate

assign st12 = {st04[40:39], ahas118, ahas117, ahas116, ahas115, ahas114, ahas113, ahas112, ahas111,  ahas110, fas11, has113, has112, has111, has110, st03[4:0]};
assign st13 = { ahac118, ahac117, ahac116, ahac115, ahac114, ahac113, ahac112, ahac111,  ahac110, fac11, hac113, hac112, hac111, hac110};

assign st14 = st06;
assign st15 = st07;

/*
wire [63:0] cfpp1;
assign cfpp1= st10+{st11,2'b00}+{st12,10'b0000000000}+{st13,16'b0000000000000000}+{st14,24'b000000000000000000000000}+{st15,28'b0000000000000000000000000000};

assign product=cfpp1;*/

//******************** STAGE 3 of Wallace tree********************//
wire has200;
wire has201;
wire has202;
wire has203;
wire has204;
wire has205;
wire has206;
wire has207;

wire hac200;
wire hac201;
wire hac202;
wire hac203;
wire hac204;
wire hac205;
wire hac206;
wire hac207;

wire ahas200;
wire ahas201;
wire ahas202;
wire ahas203;
wire ahas204;
wire ahas205;
wire ahas206;
wire ahas207;

wire ahac200;
wire ahac201;
wire ahac202;
wire ahac203;
wire ahac204;
wire ahac205;
wire ahac206;
wire ahac207;

wire has210;
wire has211;
wire has212;
wire has213;

wire hac210;
wire hac211;
wire hac212;
wire hac213;

wire ahas210;
wire ahas211;
wire ahas212;
wire ahas213;
wire ahas214;
wire ahas215;
wire ahas216;
wire ahas217;

wire ahac210;
wire ahac211;
wire ahac212;
wire ahac213;
wire ahac214;
wire ahac215;
wire ahac216;
wire ahac217;

wire [37:0] fas20;
wire [37:0] fac20;

wire [26:0] fas21;
wire [26:0] fac21;

wire [(WIDTH*2)-1:0] st20;
wire [53:0] st21;
wire [47:0] st22;
wire [38:0] st23;

HALF_ADDER ha200(.a(st10[2]), .b(st11[0]) , .sum(has200), .cout(hac200));
HALF_ADDER ha201(.a(st10[3]), .b(st11[1]) , .sum(has201), .cout(hac201));
HALF_ADDER ha202(.a(st10[4]), .b(st11[2]) , .sum(has202), .cout(hac202));
HALF_ADDER ha203(.a(st10[5]), .b(st11[3]) , .sum(has203), .cout(hac203));
HALF_ADDER ha204(.a(st10[6]), .b(st11[4]) , .sum(has204), .cout(hac204));
HALF_ADDER ha205(.a(st10[7]), .b(st11[5]) , .sum(has205), .cout(hac205));
HALF_ADDER ha206(.a(st10[8]), .b(st11[6]) , .sum(has206), .cout(hac206));
HALF_ADDER ha207(.a(st10[9]), .b(st11[7]) , .sum(has207), .cout(hac207));

HALF_ADDER aha200(.a(st10[48]), .b(st12[38]) , .sum(ahas200), .cout(ahac200));
HALF_ADDER aha201(.a(st10[49]), .b(st12[39]) , .sum(ahas201), .cout(ahac201));
HALF_ADDER aha202(.a(st10[50]), .b(st12[40]) , .sum(ahas202), .cout(ahac202));
HALF_ADDER aha203(.a(st10[51]), .b(st12[41]) , .sum(ahas203), .cout(ahac203));
HALF_ADDER aha204(.a(st10[52]), .b(st12[42]) , .sum(ahas204), .cout(ahac204));
HALF_ADDER aha205(.a(st10[53]), .b(st12[43]) , .sum(ahas205), .cout(ahac205));
HALF_ADDER aha206(.a(st10[54]), .b(st12[44]) , .sum(ahas206), .cout(ahac206));
HALF_ADDER aha207(.a(st10[55]), .b(st12[45]) , .sum(ahas207), .cout(ahac207));

generate
	for (i = 0; i < 38; i = i + 1) begin:	for_s20
		FULL_ADDER fa20(.a(st10[i + 10]), .b(st11[i + 8]), .cin(st12[i]), .sum(fas20[i]), .cout(fac20[i]));
	end
endgenerate


assign st20 = {st10[63:56], ahas207, ahas206, ahas205, ahas204, ahas203, ahas202, ahas201, ahas200, fas20, has207, has206, has205, has204, has203, has202, has201, has200,st10[1:0]};       
assign st21 = {ahac207, ahac206, ahac205, ahac204, ahac203, ahac202, ahac201, ahac200, fac20, hac207, hac206, hac205, hac204, hac203, hac202, hac201, hac200};

HALF_ADDER ha210(.a(st13[8]), .b(st14[0]) , .sum(has210), .cout(hac210));
HALF_ADDER ha211(.a(st13[9]), .b(st14[1]) , .sum(has211), .cout(hac211));
HALF_ADDER ha212(.a(st13[10]), .b(st14[2]) , .sum(has212), .cout(hac212));
HALF_ADDER ha213(.a(st13[11]), .b(st14[3]) , .sum(has213), .cout(hac213));

HALF_ADDER aha210(.a(st14[31]), .b(st15[27]) , .sum(ahas210), .cout(ahac210));
HALF_ADDER aha211(.a(st14[32]), .b(st15[28]) , .sum(ahas211), .cout(ahac211));
HALF_ADDER aha212(.a(st14[33]), .b(st15[29]) , .sum(ahas212), .cout(ahac212));
HALF_ADDER aha213(.a(st14[34]), .b(st15[30]) , .sum(ahas213), .cout(ahac213));
HALF_ADDER aha214(.a(st14[35]), .b(st15[31]) , .sum(ahas214), .cout(ahac214));
HALF_ADDER aha215(.a(st14[36]), .b(st15[32]) , .sum(ahas215), .cout(ahac215));
HALF_ADDER aha216(.a(st14[37]), .b(st15[33]) , .sum(ahas216), .cout(ahac216));
HALF_ADDER aha217(.a(st14[38]), .b(st15[34]) , .sum(ahas217), .cout(ahac217));

generate
        for (i = 0; i < 27; i = i + 1) begin:   for_s21
                FULL_ADDER fa21(.a(st13[i + 12]), .b(st14[i + 4]), .cin(st15[i]), .sum(fas21[i]), .cout(fac21[i]));
        end
endgenerate

assign st22 = {st14[39], ahas217, ahas216, ahas215, ahas214, ahas213, ahas212, ahas211, ahas210, fas21, has213, has212, has211, has210, st13[7:0]};	
assign st23 = {ahac217, ahac216, ahac215, ahac214, ahac213, ahac212, ahac211, ahac210, fac21, hac213, hac212, hac211, hac210};						

/*wire [63:0] cfpp1;
assign cfpp1= st20+{st21,3'b000}+{st22,16'b0000000000000000000}+{st23,25'b0000000000000000000000000000};
assign product=cfpp1; 
*/


//******************** STAGE 4 of Wallace tree********************//**//*
wire has300;
wire has301;
wire has302;
wire has303;
wire has304;
wire has305;
wire has306;
wire has307;
wire has308;
wire has309;
wire has3010;
wire has3011;
wire has3012;

wire hac300;
wire hac301;
wire hac302;
wire hac303;
wire hac304;
wire hac305;
wire hac306;
wire hac307;
wire hac308;
wire hac309;
wire hac3010;
wire hac3011;
wire hac3012;

wire ahas300;
wire ahas301;
wire ahas302;
wire ahas303;
wire ahas304;
wire ahas305;
wire ahas306;


wire ahac300;
wire ahac301;
wire ahac302;
wire ahac303;
wire ahac304;
wire ahac305;
wire ahac306;

wire [40:0] fas30;
wire [40:0] fac30;

wire [(WIDTH*2)-1:0] st30;
wire [59:0] st31;
wire [38:0] st32;

HALF_ADDER ha300(.a(st20[3]), .b(st21[0]) , .sum(has300), .cout(hac300));
HALF_ADDER ha301(.a(st20[4]), .b(st21[1]) , .sum(has301), .cout(hac301));
HALF_ADDER ha302(.a(st20[5]), .b(st21[2]) , .sum(has302), .cout(hac302));
HALF_ADDER ha303(.a(st20[6]), .b(st21[3]) , .sum(has303), .cout(hac303));
HALF_ADDER ha304(.a(st20[7]), .b(st21[4]) , .sum(has304), .cout(hac304));
HALF_ADDER ha305(.a(st20[8]), .b(st21[5]) , .sum(has305), .cout(hac305));
HALF_ADDER ha306(.a(st20[9]), .b(st21[6]) , .sum(has306), .cout(hac306));
HALF_ADDER ha307(.a(st20[10]), .b(st21[7]) , .sum(has307), .cout(hac307));
HALF_ADDER ha308(.a(st20[11]), .b(st21[8]) , .sum(has308), .cout(hac308));
HALF_ADDER ha309(.a(st20[12]), .b(st21[9]) , .sum(has309), .cout(hac309));
HALF_ADDER ha3010(.a(st20[13]), .b(st21[10]) , .sum(has3010), .cout(hac3010));
HALF_ADDER ha3011(.a(st20[14]), .b(st21[11]) , .sum(has3011), .cout(hac3011));
HALF_ADDER ha3012(.a(st20[15]), .b(st21[12]) , .sum(has3012), .cout(hac3012));

HALF_ADDER aha300(.a(st20[57]), .b(st22[41]) , .sum(ahas300), .cout(ahac300));
HALF_ADDER aha301(.a(st20[58]), .b(st22[42]) , .sum(ahas301), .cout(ahac301));
HALF_ADDER aha302(.a(st20[59]), .b(st22[43]) , .sum(ahas302), .cout(ahac302));
HALF_ADDER aha303(.a(st20[60]), .b(st22[44]) , .sum(ahas303), .cout(ahac303));
HALF_ADDER aha304(.a(st20[61]), .b(st22[45]) , .sum(ahas304), .cout(ahac304));
HALF_ADDER aha305(.a(st20[62]), .b(st22[46]) , .sum(ahas305), .cout(ahac305));
HALF_ADDER aha306(.a(st20[63]), .b(st22[47]) , .sum(ahas306), .cout(ahac306));

generate
        for (i = 0; i < 41; i = i + 1) begin:   for_s30
                FULL_ADDER fa30(.a(st20[i + 16]), .b(st21[i + 13]), .cin(st22[i]), .sum(fas30[i]), .cout(fac30[i]));
        end
endgenerate

assign st30 = {ahas306, ahas305, ahas304, ahas303, ahas302, ahas301, ahas300, fas30, has3012, has3011, has3010, has309, has308, has307, has306, has305, has304, has303, has302, has301, has300,st20[2:0]};
assign st31 = {ahac305, ahac304, ahac303, ahac302, ahac301, ahac300, fac30, hac3012, hac3011, hac3010, hac309, hac308, hac307, hac306, hac305, hac304, hac303, hac302, hac301, hac300};

assign st32 = st23;

/*wire [63:0] cfpp2;
assign cfpp2= st30+{st31,4'b0000}+{st32,24'b000000000000000000000000000};
assign product=cfpp2; 
*/

//******************** STAGE 5 of Wallace tree********************//**//*
wire has400;
wire has401;
wire has402;
wire has403;
wire has404;
wire has405;
wire has406;
wire has407;
wire has408;
wire has409;
wire has4010;
wire has4011;
wire has4012;
wire has4013;
wire has4014;
wire has4015;
wire has4016;
wire has4017;
wire has4018;
wire has4019;
wire has4020;

wire hac400;
wire hac401;
wire hac402;
wire hac403;
wire hac404;
wire hac405;
wire hac406;
wire hac407;
wire hac408;
wire hac409;
wire hac4010;
wire hac4011;
wire hac4012;
wire hac4013;
wire hac4014;
wire hac4015;
wire hac4016;
wire hac4017;
wire hac4018;
wire hac4019;
wire hac4020;

wire [40:0] fas40;
wire [40:0] fac40;

wire [(WIDTH*2)-1:0] st40;
wire [58:0] st41;

HALF_ADDER ha400(.a(st30[4]), .b(st31[0]) , .sum(has400), .cout(hac400));
HALF_ADDER ha401(.a(st30[5]), .b(st31[1]) , .sum(has401), .cout(hac401));
HALF_ADDER ha402(.a(st30[6]), .b(st31[2]) , .sum(has402), .cout(hac402));
HALF_ADDER ha403(.a(st30[7]), .b(st31[3]) , .sum(has403), .cout(hac403));
HALF_ADDER ha404(.a(st30[8]), .b(st31[4]) , .sum(has404), .cout(hac404));
HALF_ADDER ha405(.a(st30[9]), .b(st31[5]) , .sum(has405), .cout(hac405));
HALF_ADDER ha406(.a(st30[10]), .b(st31[6]) , .sum(has406), .cout(hac406));
HALF_ADDER ha407(.a(st30[11]), .b(st31[7]) , .sum(has407), .cout(hac407));
HALF_ADDER ha408(.a(st30[12]), .b(st31[8]) , .sum(has408), .cout(hac408));
HALF_ADDER ha409(.a(st30[13]), .b(st31[9]) , .sum(has409), .cout(hac409));
HALF_ADDER ha4010(.a(st30[14]), .b(st31[10]) , .sum(has4010), .cout(hac4010));
HALF_ADDER ha4011(.a(st30[15]), .b(st31[11]) , .sum(has4011), .cout(hac4011));
HALF_ADDER ha4012(.a(st30[16]), .b(st31[12]) , .sum(has4012), .cout(hac4012));
HALF_ADDER ha4013(.a(st30[17]), .b(st31[13]) , .sum(has4013), .cout(hac4013));
HALF_ADDER ha4014(.a(st30[18]), .b(st31[14]) , .sum(has4014), .cout(hac4014));
HALF_ADDER ha4015(.a(st30[19]), .b(st31[15]) , .sum(has4015), .cout(hac4015));
HALF_ADDER ha4016(.a(st30[20]), .b(st31[16]) , .sum(has4016), .cout(hac4016));
HALF_ADDER ha4017(.a(st30[21]), .b(st31[17]) , .sum(has4017), .cout(hac4017));
HALF_ADDER ha4018(.a(st30[22]), .b(st31[18]) , .sum(has4018), .cout(hac4018));
HALF_ADDER ha4019(.a(st30[23]), .b(st31[19]) , .sum(has4019), .cout(hac4019));
HALF_ADDER ha4020(.a(st30[24]), .b(st31[20]) , .sum(has4020), .cout(hac4020));

generate
        for (i = 0; i < 39; i = i + 1) begin:   for_s40
                FULL_ADDER fa40(.a(st30[i + 25]), .b(st31[i + 21]), .cin(st32[i]), .sum(fas40[i]), .cout(fac40[i]));
        end
endgenerate

assign st40 = {fas40, has4020, has4019, has4018, has4017, has4016, has4015, has4014, has4013, has4012, has4011, has4010, has409, has408, has407, has406, has405, has404, has403, has402, has401, has400,st30[3:0]};
assign st41 = { fac40[37:0], hac4020, hac4019, hac4018, hac4017, hac4016, hac4015, hac4014, hac4013, hac4012, hac4011, hac4010, hac409, hac408, hac407, hac406, hac405, hac404, hac403, hac402, hac401, hac400};

/*
wire [63:0] cfpp1;
assign cfpp1= st40+{st41,5'b00000};
assign product=cfpp1;  
*/

//wire [63:0] SUM_reg;
//wire [58:0] CARRY_reg;

//assign SUM_reg=st40;
//assign CARRY_reg=st41;


//******************** Tree ADDER STAGE  ********************
wire  [58:0] OPA;
wire  [58:0] OPB;
wire CIN;
wire PHI;
wire [0:0] PBIT;
wire [58:0] CARRY;
assign CIN=1'b0;
assign PHI=1'b0;
wire [58:0]prod;
assign OPA=(st40[(WIDTH*2)-1:5]);
assign OPB=(st41);

DBLCADDER_64_64 ADDER (.OPA(OPA) , .OPB(OPB) , .CIN (CIN) , .PHI (PHI) , .SUM(prod), .COUT() );
assign product={prod,st40[4:0]};

//******************** Pipeline Register ********************
/*reg [(WIDTH*2)-1:0] pipereg;

always @(posedge CLK) 
begin
        pipereg <= {prod,st40[4:0]};
end
assign product=pipereg;
*/
endmodule

module INVBLOCK ( GIN, PHI, GOUT );
input  GIN;
input  PHI;
output GOUT;
   assign GOUT =   GIN;
endmodule


module XXOR1 ( A, B, GIN, PHI, SUM );
input  A;
input  B;
input  GIN;
input  PHI;
output SUM;
   assign SUM = (  (A ^ B)) ^ GIN;
endmodule


module BLOCK0 ( A, B, PHI, POUT, GOUT );
input  A;
input  B;
input  PHI;
output POUT;
output GOUT;
   assign POUT =   (A | B);
   assign GOUT =   (A & B);
endmodule


module BLOCK1 ( PIN1, PIN2, GIN1, GIN2, PHI, POUT, GOUT );
input  PIN1;
input  PIN2;
input  GIN1;
input  GIN2;
input  PHI;
output POUT;
output GOUT;
   assign POUT =   (PIN1 & PIN2);
   assign GOUT =  (GIN2 | (PIN2 & GIN1));
endmodule


module BLOCK2 ( PIN1, PIN2, GIN1, GIN2, PHI, POUT, GOUT );
input  PIN1;
input  PIN2;
input  GIN1;
input  GIN2;
input  PHI;
output POUT;
output GOUT;
   assign POUT =   (PIN1 & PIN2);
   assign GOUT =   (GIN2 | (PIN2 & GIN1));
endmodule


module BLOCK1A ( PIN2, GIN1, GIN2, PHI, GOUT );
input  PIN2;
input  GIN1;
input  GIN2;
input  PHI;
output GOUT;
   assign GOUT = (GIN2 | (PIN2 & GIN1));
endmodule


module BLOCK2A ( PIN2, GIN1, GIN2, PHI, GOUT );
input  PIN2;
input  GIN1;
input  GIN2;
input  PHI;
output GOUT;
   assign GOUT =   (GIN2 | (PIN2 & GIN1));
endmodule

module PRESTAGE_64 ( A, B, CIN, PHI, POUT, GOUT );
input  [58:0] A;
input  [58:0] B;
input  CIN;
input  PHI;
output [58:0] POUT;
output [59:0] GOUT;
   BLOCK0 U10 (A[0] , B[0] , PHI , POUT[0] , GOUT[1] );
   BLOCK0 U11 (A[1] , B[1] , PHI , POUT[1] , GOUT[2] );
   BLOCK0 U12 (A[2] , B[2] , PHI , POUT[2] , GOUT[3] );
   BLOCK0 U13 (A[3] , B[3] , PHI , POUT[3] , GOUT[4] );
   BLOCK0 U14 (A[4] , B[4] , PHI , POUT[4] , GOUT[5] );
   BLOCK0 U15 (A[5] , B[5] , PHI , POUT[5] , GOUT[6] );
   BLOCK0 U16 (A[6] , B[6] , PHI , POUT[6] , GOUT[7] );
   BLOCK0 U17 (A[7] , B[7] , PHI , POUT[7] , GOUT[8] );
   BLOCK0 U18 (A[8] , B[8] , PHI , POUT[8] , GOUT[9] );
   BLOCK0 U19 (A[9] , B[9] , PHI , POUT[9] , GOUT[10] );
   BLOCK0 U110 (A[10] , B[10] , PHI , POUT[10] , GOUT[11] );
   BLOCK0 U111 (A[11] , B[11] , PHI , POUT[11] , GOUT[12] );
   BLOCK0 U112 (A[12] , B[12] , PHI , POUT[12] , GOUT[13] );
   BLOCK0 U113 (A[13] , B[13] , PHI , POUT[13] , GOUT[14] );
   BLOCK0 U114 (A[14] , B[14] , PHI , POUT[14] , GOUT[15] );
   BLOCK0 U115 (A[15] , B[15] , PHI , POUT[15] , GOUT[16] );
   BLOCK0 U116 (A[16] , B[16] , PHI , POUT[16] , GOUT[17] );
   BLOCK0 U117 (A[17] , B[17] , PHI , POUT[17] , GOUT[18] );
   BLOCK0 U118 (A[18] , B[18] , PHI , POUT[18] , GOUT[19] );
   BLOCK0 U119 (A[19] , B[19] , PHI , POUT[19] , GOUT[20] );
   BLOCK0 U120 (A[20] , B[20] , PHI , POUT[20] , GOUT[21] );
   BLOCK0 U121 (A[21] , B[21] , PHI , POUT[21] , GOUT[22] );
   BLOCK0 U122 (A[22] , B[22] , PHI , POUT[22] , GOUT[23] );
   BLOCK0 U123 (A[23] , B[23] , PHI , POUT[23] , GOUT[24] );
   BLOCK0 U124 (A[24] , B[24] , PHI , POUT[24] , GOUT[25] );
   BLOCK0 U125 (A[25] , B[25] , PHI , POUT[25] , GOUT[26] );
   BLOCK0 U126 (A[26] , B[26] , PHI , POUT[26] , GOUT[27] );
   BLOCK0 U127 (A[27] , B[27] , PHI , POUT[27] , GOUT[28] );
   BLOCK0 U128 (A[28] , B[28] , PHI , POUT[28] , GOUT[29] );
   BLOCK0 U129 (A[29] , B[29] , PHI , POUT[29] , GOUT[30] );
   BLOCK0 U130 (A[30] , B[30] , PHI , POUT[30] , GOUT[31] );
   BLOCK0 U131 (A[31] , B[31] , PHI , POUT[31] , GOUT[32] );
   BLOCK0 U132 (A[32] , B[32] , PHI , POUT[32] , GOUT[33] );
   BLOCK0 U133 (A[33] , B[33] , PHI , POUT[33] , GOUT[34] );
   BLOCK0 U134 (A[34] , B[34] , PHI , POUT[34] , GOUT[35] );
   BLOCK0 U135 (A[35] , B[35] , PHI , POUT[35] , GOUT[36] );
   BLOCK0 U136 (A[36] , B[36] , PHI , POUT[36] , GOUT[37] );
   BLOCK0 U137 (A[37] , B[37] , PHI , POUT[37] , GOUT[38] );
   BLOCK0 U138 (A[38] , B[38] , PHI , POUT[38] , GOUT[39] );
   BLOCK0 U139 (A[39] , B[39] , PHI , POUT[39] , GOUT[40] );
   BLOCK0 U140 (A[40] , B[40] , PHI , POUT[40] , GOUT[41] );
   BLOCK0 U141 (A[41] , B[41] , PHI , POUT[41] , GOUT[42] );
   BLOCK0 U142 (A[42] , B[42] , PHI , POUT[42] , GOUT[43] );
   BLOCK0 U143 (A[43] , B[43] , PHI , POUT[43] , GOUT[44] );
   BLOCK0 U144 (A[44] , B[44] , PHI , POUT[44] , GOUT[45] );
   BLOCK0 U145 (A[45] , B[45] , PHI , POUT[45] , GOUT[46] );
   BLOCK0 U146 (A[46] , B[46] , PHI , POUT[46] , GOUT[47] );
   BLOCK0 U147 (A[47] , B[47] , PHI , POUT[47] , GOUT[48] );
   BLOCK0 U148 (A[48] , B[48] , PHI , POUT[48] , GOUT[49] );
   BLOCK0 U149 (A[49] , B[49] , PHI , POUT[49] , GOUT[50] );
   BLOCK0 U150 (A[50] , B[50] , PHI , POUT[50] , GOUT[51] );
   BLOCK0 U151 (A[51] , B[51] , PHI , POUT[51] , GOUT[52] );
   BLOCK0 U152 (A[52] , B[52] , PHI , POUT[52] , GOUT[53] );
   BLOCK0 U153 (A[53] , B[53] , PHI , POUT[53] , GOUT[54] );
   BLOCK0 U154 (A[54] , B[54] , PHI , POUT[54] , GOUT[55] );
   BLOCK0 U155 (A[55] , B[55] , PHI , POUT[55] , GOUT[56] );
   BLOCK0 U156 (A[56] , B[56] , PHI , POUT[56] , GOUT[57] );
   BLOCK0 U157 (A[57] , B[57] , PHI , POUT[57] , GOUT[58] );
   BLOCK0 U158 (A[58] , B[58] , PHI , POUT[58] , GOUT[59] );
   INVBLOCK U2 (CIN , PHI , GOUT[0] );
endmodule


module DBLC_0_64 ( PIN, GIN, PHI, POUT, GOUT );
input  [58:0] PIN;
input  [59:0] GIN;
input  PHI;
output [57:0] POUT;
output [59:0] GOUT;
   INVBLOCK U10 (GIN[0] , PHI , GOUT[0] );
   BLOCK1A U21 (PIN[0] , GIN[0] , GIN[1] , PHI , GOUT[1] );
   BLOCK1 U32 (PIN[0] , PIN[1] , GIN[1] , GIN[2] , PHI , POUT[0] , GOUT[2] );
   BLOCK1 U33 (PIN[1] , PIN[2] , GIN[2] , GIN[3] , PHI , POUT[1] , GOUT[3] );
   BLOCK1 U34 (PIN[2] , PIN[3] , GIN[3] , GIN[4] , PHI , POUT[2] , GOUT[4] );
   BLOCK1 U35 (PIN[3] , PIN[4] , GIN[4] , GIN[5] , PHI , POUT[3] , GOUT[5] );
   BLOCK1 U36 (PIN[4] , PIN[5] , GIN[5] , GIN[6] , PHI , POUT[4] , GOUT[6] );
   BLOCK1 U37 (PIN[5] , PIN[6] , GIN[6] , GIN[7] , PHI , POUT[5] , GOUT[7] );
   BLOCK1 U38 (PIN[6] , PIN[7] , GIN[7] , GIN[8] , PHI , POUT[6] , GOUT[8] );
   BLOCK1 U39 (PIN[7] , PIN[8] , GIN[8] , GIN[9] , PHI , POUT[7] , GOUT[9] );
   BLOCK1 U310 (PIN[8] , PIN[9] , GIN[9] , GIN[10] , PHI , POUT[8] , GOUT[10] );
   BLOCK1 U311 (PIN[9] , PIN[10] , GIN[10] , GIN[11] , PHI , POUT[9] , GOUT[11] );
   BLOCK1 U312 (PIN[10] , PIN[11] , GIN[11] , GIN[12] , PHI , POUT[10] , GOUT[12] );
   BLOCK1 U313 (PIN[11] , PIN[12] , GIN[12] , GIN[13] , PHI , POUT[11] , GOUT[13] );
   BLOCK1 U314 (PIN[12] , PIN[13] , GIN[13] , GIN[14] , PHI , POUT[12] , GOUT[14] );
   BLOCK1 U315 (PIN[13] , PIN[14] , GIN[14] , GIN[15] , PHI , POUT[13] , GOUT[15] );
   BLOCK1 U316 (PIN[14] , PIN[15] , GIN[15] , GIN[16] , PHI , POUT[14] , GOUT[16] );
   BLOCK1 U317 (PIN[15] , PIN[16] , GIN[16] , GIN[17] , PHI , POUT[15] , GOUT[17] );
   BLOCK1 U318 (PIN[16] , PIN[17] , GIN[17] , GIN[18] , PHI , POUT[16] , GOUT[18] );
   BLOCK1 U319 (PIN[17] , PIN[18] , GIN[18] , GIN[19] , PHI , POUT[17] , GOUT[19] );
   BLOCK1 U320 (PIN[18] , PIN[19] , GIN[19] , GIN[20] , PHI , POUT[18] , GOUT[20] );
   BLOCK1 U321 (PIN[19] , PIN[20] , GIN[20] , GIN[21] , PHI , POUT[19] , GOUT[21] );
   BLOCK1 U322 (PIN[20] , PIN[21] , GIN[21] , GIN[22] , PHI , POUT[20] , GOUT[22] );
   BLOCK1 U323 (PIN[21] , PIN[22] , GIN[22] , GIN[23] , PHI , POUT[21] , GOUT[23] );
   BLOCK1 U324 (PIN[22] , PIN[23] , GIN[23] , GIN[24] , PHI , POUT[22] , GOUT[24] );
   BLOCK1 U325 (PIN[23] , PIN[24] , GIN[24] , GIN[25] , PHI , POUT[23] , GOUT[25] );
   BLOCK1 U326 (PIN[24] , PIN[25] , GIN[25] , GIN[26] , PHI , POUT[24] , GOUT[26] );
   BLOCK1 U327 (PIN[25] , PIN[26] , GIN[26] , GIN[27] , PHI , POUT[25] , GOUT[27] );
   BLOCK1 U328 (PIN[26] , PIN[27] , GIN[27] , GIN[28] , PHI , POUT[26] , GOUT[28] );
   BLOCK1 U329 (PIN[27] , PIN[28] , GIN[28] , GIN[29] , PHI , POUT[27] , GOUT[29] );
   BLOCK1 U330 (PIN[28] , PIN[29] , GIN[29] , GIN[30] , PHI , POUT[28] , GOUT[30] );
   BLOCK1 U331 (PIN[29] , PIN[30] , GIN[30] , GIN[31] , PHI , POUT[29] , GOUT[31] );
   BLOCK1 U332 (PIN[30] , PIN[31] , GIN[31] , GIN[32] , PHI , POUT[30] , GOUT[32] );
   BLOCK1 U333 (PIN[31] , PIN[32] , GIN[32] , GIN[33] , PHI , POUT[31] , GOUT[33] );
   BLOCK1 U334 (PIN[32] , PIN[33] , GIN[33] , GIN[34] , PHI , POUT[32] , GOUT[34] );
   BLOCK1 U335 (PIN[33] , PIN[34] , GIN[34] , GIN[35] , PHI , POUT[33] , GOUT[35] );
   BLOCK1 U336 (PIN[34] , PIN[35] , GIN[35] , GIN[36] , PHI , POUT[34] , GOUT[36] );
   BLOCK1 U337 (PIN[35] , PIN[36] , GIN[36] , GIN[37] , PHI , POUT[35] , GOUT[37] );
   BLOCK1 U338 (PIN[36] , PIN[37] , GIN[37] , GIN[38] , PHI , POUT[36] , GOUT[38] );
   BLOCK1 U339 (PIN[37] , PIN[38] , GIN[38] , GIN[39] , PHI , POUT[37] , GOUT[39] );
   BLOCK1 U340 (PIN[38] , PIN[39] , GIN[39] , GIN[40] , PHI , POUT[38] , GOUT[40] );
   BLOCK1 U341 (PIN[39] , PIN[40] , GIN[40] , GIN[41] , PHI , POUT[39] , GOUT[41] );
   BLOCK1 U342 (PIN[40] , PIN[41] , GIN[41] , GIN[42] , PHI , POUT[40] , GOUT[42] );
   BLOCK1 U343 (PIN[41] , PIN[42] , GIN[42] , GIN[43] , PHI , POUT[41] , GOUT[43] );
   BLOCK1 U344 (PIN[42] , PIN[43] , GIN[43] , GIN[44] , PHI , POUT[42] , GOUT[44] );
   BLOCK1 U345 (PIN[43] , PIN[44] , GIN[44] , GIN[45] , PHI , POUT[43] , GOUT[45] );
   BLOCK1 U346 (PIN[44] , PIN[45] , GIN[45] , GIN[46] , PHI , POUT[44] , GOUT[46] );
   BLOCK1 U347 (PIN[45] , PIN[46] , GIN[46] , GIN[47] , PHI , POUT[45] , GOUT[47] );
   BLOCK1 U348 (PIN[46] , PIN[47] , GIN[47] , GIN[48] , PHI , POUT[46] , GOUT[48] );
   BLOCK1 U349 (PIN[47] , PIN[48] , GIN[48] , GIN[49] , PHI , POUT[47] , GOUT[49] );
   BLOCK1 U350 (PIN[48] , PIN[49] , GIN[49] , GIN[50] , PHI , POUT[48] , GOUT[50] );
   BLOCK1 U351 (PIN[49] , PIN[50] , GIN[50] , GIN[51] , PHI , POUT[49] , GOUT[51] );
   BLOCK1 U352 (PIN[50] , PIN[51] , GIN[51] , GIN[52] , PHI , POUT[50] , GOUT[52] );
   BLOCK1 U353 (PIN[51] , PIN[52] , GIN[52] , GIN[53] , PHI , POUT[51] , GOUT[53] );
   BLOCK1 U354 (PIN[52] , PIN[53] , GIN[53] , GIN[54] , PHI , POUT[52] , GOUT[54] );
   BLOCK1 U355 (PIN[53] , PIN[54] , GIN[54] , GIN[55] , PHI , POUT[53] , GOUT[55] );
   BLOCK1 U356 (PIN[54] , PIN[55] , GIN[55] , GIN[56] , PHI , POUT[54] , GOUT[56] );
   BLOCK1 U357 (PIN[55] , PIN[56] , GIN[56] , GIN[57] , PHI , POUT[55] , GOUT[57] );
   BLOCK1 U358 (PIN[56] , PIN[57] , GIN[57] , GIN[58] , PHI , POUT[56] , GOUT[58] );
   BLOCK1 U359 (PIN[57] , PIN[58] , GIN[58] , GIN[59] , PHI , POUT[57] , GOUT[59] );
endmodule


module DBLC_1_64 ( PIN, GIN, PHI, POUT, GOUT );
input  [57:0] PIN;
input  [59:0] GIN;
input  PHI;
output [55:0] POUT;
output [59:0] GOUT;
   INVBLOCK U10 (GIN[0] , PHI , GOUT[0] );
   INVBLOCK U11 (GIN[1] , PHI , GOUT[1] );
   BLOCK2A U22 (PIN[0] , GIN[0] , GIN[2] , PHI , GOUT[2] );
   BLOCK2A U23 (PIN[1] , GIN[1] , GIN[3] , PHI , GOUT[3] );
   BLOCK2 U34 (PIN[0] , PIN[2] , GIN[2] , GIN[4] , PHI , POUT[0] , GOUT[4] );
   BLOCK2 U35 (PIN[1] , PIN[3] , GIN[3] , GIN[5] , PHI , POUT[1] , GOUT[5] );
   BLOCK2 U36 (PIN[2] , PIN[4] , GIN[4] , GIN[6] , PHI , POUT[2] , GOUT[6] );
   BLOCK2 U37 (PIN[3] , PIN[5] , GIN[5] , GIN[7] , PHI , POUT[3] , GOUT[7] );
   BLOCK2 U38 (PIN[4] , PIN[6] , GIN[6] , GIN[8] , PHI , POUT[4] , GOUT[8] );
   BLOCK2 U39 (PIN[5] , PIN[7] , GIN[7] , GIN[9] , PHI , POUT[5] , GOUT[9] );
   BLOCK2 U310 (PIN[6] , PIN[8] , GIN[8] , GIN[10] , PHI , POUT[6] , GOUT[10] );
   BLOCK2 U311 (PIN[7] , PIN[9] , GIN[9] , GIN[11] , PHI , POUT[7] , GOUT[11] );
   BLOCK2 U312 (PIN[8] , PIN[10] , GIN[10] , GIN[12] , PHI , POUT[8] , GOUT[12] );
   BLOCK2 U313 (PIN[9] , PIN[11] , GIN[11] , GIN[13] , PHI , POUT[9] , GOUT[13] );
   BLOCK2 U314 (PIN[10] , PIN[12] , GIN[12] , GIN[14] , PHI , POUT[10] , GOUT[14] );
   BLOCK2 U315 (PIN[11] , PIN[13] , GIN[13] , GIN[15] , PHI , POUT[11] , GOUT[15] );
   BLOCK2 U316 (PIN[12] , PIN[14] , GIN[14] , GIN[16] , PHI , POUT[12] , GOUT[16] );
   BLOCK2 U317 (PIN[13] , PIN[15] , GIN[15] , GIN[17] , PHI , POUT[13] , GOUT[17] );
   BLOCK2 U318 (PIN[14] , PIN[16] , GIN[16] , GIN[18] , PHI , POUT[14] , GOUT[18] );
   BLOCK2 U319 (PIN[15] , PIN[17] , GIN[17] , GIN[19] , PHI , POUT[15] , GOUT[19] );
   BLOCK2 U320 (PIN[16] , PIN[18] , GIN[18] , GIN[20] , PHI , POUT[16] , GOUT[20] );
   BLOCK2 U321 (PIN[17] , PIN[19] , GIN[19] , GIN[21] , PHI , POUT[17] , GOUT[21] );
   BLOCK2 U322 (PIN[18] , PIN[20] , GIN[20] , GIN[22] , PHI , POUT[18] , GOUT[22] );
   BLOCK2 U323 (PIN[19] , PIN[21] , GIN[21] , GIN[23] , PHI , POUT[19] , GOUT[23] );
   BLOCK2 U324 (PIN[20] , PIN[22] , GIN[22] , GIN[24] , PHI , POUT[20] , GOUT[24] );
   BLOCK2 U325 (PIN[21] , PIN[23] , GIN[23] , GIN[25] , PHI , POUT[21] , GOUT[25] );
   BLOCK2 U326 (PIN[22] , PIN[24] , GIN[24] , GIN[26] , PHI , POUT[22] , GOUT[26] );
   BLOCK2 U327 (PIN[23] , PIN[25] , GIN[25] , GIN[27] , PHI , POUT[23] , GOUT[27] );
   BLOCK2 U328 (PIN[24] , PIN[26] , GIN[26] , GIN[28] , PHI , POUT[24] , GOUT[28] );
   BLOCK2 U329 (PIN[25] , PIN[27] , GIN[27] , GIN[29] , PHI , POUT[25] , GOUT[29] );
   BLOCK2 U330 (PIN[26] , PIN[28] , GIN[28] , GIN[30] , PHI , POUT[26] , GOUT[30] );
   BLOCK2 U331 (PIN[27] , PIN[29] , GIN[29] , GIN[31] , PHI , POUT[27] , GOUT[31] );
   BLOCK2 U332 (PIN[28] , PIN[30] , GIN[30] , GIN[32] , PHI , POUT[28] , GOUT[32] );
   BLOCK2 U333 (PIN[29] , PIN[31] , GIN[31] , GIN[33] , PHI , POUT[29] , GOUT[33] );
   BLOCK2 U334 (PIN[30] , PIN[32] , GIN[32] , GIN[34] , PHI , POUT[30] , GOUT[34] );
   BLOCK2 U335 (PIN[31] , PIN[33] , GIN[33] , GIN[35] , PHI , POUT[31] , GOUT[35] );
   BLOCK2 U336 (PIN[32] , PIN[34] , GIN[34] , GIN[36] , PHI , POUT[32] , GOUT[36] );
   BLOCK2 U337 (PIN[33] , PIN[35] , GIN[35] , GIN[37] , PHI , POUT[33] , GOUT[37] );
   BLOCK2 U338 (PIN[34] , PIN[36] , GIN[36] , GIN[38] , PHI , POUT[34] , GOUT[38] );
   BLOCK2 U339 (PIN[35] , PIN[37] , GIN[37] , GIN[39] , PHI , POUT[35] , GOUT[39] );
   BLOCK2 U340 (PIN[36] , PIN[38] , GIN[38] , GIN[40] , PHI , POUT[36] , GOUT[40] );
   BLOCK2 U341 (PIN[37] , PIN[39] , GIN[39] , GIN[41] , PHI , POUT[37] , GOUT[41] );
   BLOCK2 U342 (PIN[38] , PIN[40] , GIN[40] , GIN[42] , PHI , POUT[38] , GOUT[42] );
   BLOCK2 U343 (PIN[39] , PIN[41] , GIN[41] , GIN[43] , PHI , POUT[39] , GOUT[43] );
   BLOCK2 U344 (PIN[40] , PIN[42] , GIN[42] , GIN[44] , PHI , POUT[40] , GOUT[44] );
   BLOCK2 U345 (PIN[41] , PIN[43] , GIN[43] , GIN[45] , PHI , POUT[41] , GOUT[45] );
   BLOCK2 U346 (PIN[42] , PIN[44] , GIN[44] , GIN[46] , PHI , POUT[42] , GOUT[46] );
   BLOCK2 U347 (PIN[43] , PIN[45] , GIN[45] , GIN[47] , PHI , POUT[43] , GOUT[47] );
   BLOCK2 U348 (PIN[44] , PIN[46] , GIN[46] , GIN[48] , PHI , POUT[44] , GOUT[48] );
   BLOCK2 U349 (PIN[45] , PIN[47] , GIN[47] , GIN[49] , PHI , POUT[45] , GOUT[49] );
   BLOCK2 U350 (PIN[46] , PIN[48] , GIN[48] , GIN[50] , PHI , POUT[46] , GOUT[50] );
   BLOCK2 U351 (PIN[47] , PIN[49] , GIN[49] , GIN[51] , PHI , POUT[47] , GOUT[51] );
   BLOCK2 U352 (PIN[48] , PIN[50] , GIN[50] , GIN[52] , PHI , POUT[48] , GOUT[52] );
   BLOCK2 U353 (PIN[49] , PIN[51] , GIN[51] , GIN[53] , PHI , POUT[49] , GOUT[53] );
   BLOCK2 U354 (PIN[50] , PIN[52] , GIN[52] , GIN[54] , PHI , POUT[50] , GOUT[54] );
   BLOCK2 U355 (PIN[51] , PIN[53] , GIN[53] , GIN[55] , PHI , POUT[51] , GOUT[55] );
   BLOCK2 U356 (PIN[52] , PIN[54] , GIN[54] , GIN[56] , PHI , POUT[52] , GOUT[56] );
   BLOCK2 U357 (PIN[53] , PIN[55] , GIN[55] , GIN[57] , PHI , POUT[53] , GOUT[57] );
   BLOCK2 U358 (PIN[54] , PIN[56] , GIN[56] , GIN[58] , PHI , POUT[54] , GOUT[58] );
   BLOCK2 U359 (PIN[55] , PIN[57] , GIN[57] , GIN[59] , PHI , POUT[55] , GOUT[59] );
endmodule


module DBLC_2_64 ( PIN, GIN, PHI, POUT, GOUT );
input  [55:0] PIN;
input  [59:0] GIN;
input  PHI;
output [51:0] POUT;
output [59:0] GOUT;
   INVBLOCK U10 (GIN[0] , PHI , GOUT[0] );
   INVBLOCK U11 (GIN[1] , PHI , GOUT[1] );
   INVBLOCK U12 (GIN[2] , PHI , GOUT[2] );
   INVBLOCK U13 (GIN[3] , PHI , GOUT[3] );
   BLOCK1A U24 (PIN[0] , GIN[0] , GIN[4] , PHI , GOUT[4] );
   BLOCK1A U25 (PIN[1] , GIN[1] , GIN[5] , PHI , GOUT[5] );
   BLOCK1A U26 (PIN[2] , GIN[2] , GIN[6] , PHI , GOUT[6] );
   BLOCK1A U27 (PIN[3] , GIN[3] , GIN[7] , PHI , GOUT[7] );
   BLOCK1 U38 (PIN[0] , PIN[4] , GIN[4] , GIN[8] , PHI , POUT[0] , GOUT[8] );
   BLOCK1 U39 (PIN[1] , PIN[5] , GIN[5] , GIN[9] , PHI , POUT[1] , GOUT[9] );
   BLOCK1 U310 (PIN[2] , PIN[6] , GIN[6] , GIN[10] , PHI , POUT[2] , GOUT[10] );
   BLOCK1 U311 (PIN[3] , PIN[7] , GIN[7] , GIN[11] , PHI , POUT[3] , GOUT[11] );
   BLOCK1 U312 (PIN[4] , PIN[8] , GIN[8] , GIN[12] , PHI , POUT[4] , GOUT[12] );
   BLOCK1 U313 (PIN[5] , PIN[9] , GIN[9] , GIN[13] , PHI , POUT[5] , GOUT[13] );
   BLOCK1 U314 (PIN[6] , PIN[10] , GIN[10] , GIN[14] , PHI , POUT[6] , GOUT[14] );
   BLOCK1 U315 (PIN[7] , PIN[11] , GIN[11] , GIN[15] , PHI , POUT[7] , GOUT[15] );
   BLOCK1 U316 (PIN[8] , PIN[12] , GIN[12] , GIN[16] , PHI , POUT[8] , GOUT[16] );
   BLOCK1 U317 (PIN[9] , PIN[13] , GIN[13] , GIN[17] , PHI , POUT[9] , GOUT[17] );
   BLOCK1 U318 (PIN[10] , PIN[14] , GIN[14] , GIN[18] , PHI , POUT[10] , GOUT[18] );
   BLOCK1 U319 (PIN[11] , PIN[15] , GIN[15] , GIN[19] , PHI , POUT[11] , GOUT[19] );
   BLOCK1 U320 (PIN[12] , PIN[16] , GIN[16] , GIN[20] , PHI , POUT[12] , GOUT[20] );
   BLOCK1 U321 (PIN[13] , PIN[17] , GIN[17] , GIN[21] , PHI , POUT[13] , GOUT[21] );
   BLOCK1 U322 (PIN[14] , PIN[18] , GIN[18] , GIN[22] , PHI , POUT[14] , GOUT[22] );
   BLOCK1 U323 (PIN[15] , PIN[19] , GIN[19] , GIN[23] , PHI , POUT[15] , GOUT[23] );
   BLOCK1 U324 (PIN[16] , PIN[20] , GIN[20] , GIN[24] , PHI , POUT[16] , GOUT[24] );
   BLOCK1 U325 (PIN[17] , PIN[21] , GIN[21] , GIN[25] , PHI , POUT[17] , GOUT[25] );
   BLOCK1 U326 (PIN[18] , PIN[22] , GIN[22] , GIN[26] , PHI , POUT[18] , GOUT[26] );
   BLOCK1 U327 (PIN[19] , PIN[23] , GIN[23] , GIN[27] , PHI , POUT[19] , GOUT[27] );
   BLOCK1 U328 (PIN[20] , PIN[24] , GIN[24] , GIN[28] , PHI , POUT[20] , GOUT[28] );
   BLOCK1 U329 (PIN[21] , PIN[25] , GIN[25] , GIN[29] , PHI , POUT[21] , GOUT[29] );
   BLOCK1 U330 (PIN[22] , PIN[26] , GIN[26] , GIN[30] , PHI , POUT[22] , GOUT[30] );
   BLOCK1 U331 (PIN[23] , PIN[27] , GIN[27] , GIN[31] , PHI , POUT[23] , GOUT[31] );
   BLOCK1 U332 (PIN[24] , PIN[28] , GIN[28] , GIN[32] , PHI , POUT[24] , GOUT[32] );
   BLOCK1 U333 (PIN[25] , PIN[29] , GIN[29] , GIN[33] , PHI , POUT[25] , GOUT[33] );
   BLOCK1 U334 (PIN[26] , PIN[30] , GIN[30] , GIN[34] , PHI , POUT[26] , GOUT[34] );
   BLOCK1 U335 (PIN[27] , PIN[31] , GIN[31] , GIN[35] , PHI , POUT[27] , GOUT[35] );
   BLOCK1 U336 (PIN[28] , PIN[32] , GIN[32] , GIN[36] , PHI , POUT[28] , GOUT[36] );
   BLOCK1 U337 (PIN[29] , PIN[33] , GIN[33] , GIN[37] , PHI , POUT[29] , GOUT[37] );
   BLOCK1 U338 (PIN[30] , PIN[34] , GIN[34] , GIN[38] , PHI , POUT[30] , GOUT[38] );
   BLOCK1 U339 (PIN[31] , PIN[35] , GIN[35] , GIN[39] , PHI , POUT[31] , GOUT[39] );
   BLOCK1 U340 (PIN[32] , PIN[36] , GIN[36] , GIN[40] , PHI , POUT[32] , GOUT[40] );
   BLOCK1 U341 (PIN[33] , PIN[37] , GIN[37] , GIN[41] , PHI , POUT[33] , GOUT[41] );
   BLOCK1 U342 (PIN[34] , PIN[38] , GIN[38] , GIN[42] , PHI , POUT[34] , GOUT[42] );
   BLOCK1 U343 (PIN[35] , PIN[39] , GIN[39] , GIN[43] , PHI , POUT[35] , GOUT[43] );
   BLOCK1 U344 (PIN[36] , PIN[40] , GIN[40] , GIN[44] , PHI , POUT[36] , GOUT[44] );
   BLOCK1 U345 (PIN[37] , PIN[41] , GIN[41] , GIN[45] , PHI , POUT[37] , GOUT[45] );
   BLOCK1 U346 (PIN[38] , PIN[42] , GIN[42] , GIN[46] , PHI , POUT[38] , GOUT[46] );
   BLOCK1 U347 (PIN[39] , PIN[43] , GIN[43] , GIN[47] , PHI , POUT[39] , GOUT[47] );
   BLOCK1 U348 (PIN[40] , PIN[44] , GIN[44] , GIN[48] , PHI , POUT[40] , GOUT[48] );
   BLOCK1 U349 (PIN[41] , PIN[45] , GIN[45] , GIN[49] , PHI , POUT[41] , GOUT[49] );
   BLOCK1 U350 (PIN[42] , PIN[46] , GIN[46] , GIN[50] , PHI , POUT[42] , GOUT[50] );
   BLOCK1 U351 (PIN[43] , PIN[47] , GIN[47] , GIN[51] , PHI , POUT[43] , GOUT[51] );
   BLOCK1 U352 (PIN[44] , PIN[48] , GIN[48] , GIN[52] , PHI , POUT[44] , GOUT[52] );
   BLOCK1 U353 (PIN[45] , PIN[49] , GIN[49] , GIN[53] , PHI , POUT[45] , GOUT[53] );
   BLOCK1 U354 (PIN[46] , PIN[50] , GIN[50] , GIN[54] , PHI , POUT[46] , GOUT[54] );
   BLOCK1 U355 (PIN[47] , PIN[51] , GIN[51] , GIN[55] , PHI , POUT[47] , GOUT[55] );
   BLOCK1 U356 (PIN[48] , PIN[52] , GIN[52] , GIN[56] , PHI , POUT[48] , GOUT[56] );
   BLOCK1 U357 (PIN[49] , PIN[53] , GIN[53] , GIN[57] , PHI , POUT[49] , GOUT[57] );
   BLOCK1 U358 (PIN[50] , PIN[54] , GIN[54] , GIN[58] , PHI , POUT[50] , GOUT[58] );
   BLOCK1 U359 (PIN[51] , PIN[55] , GIN[55] , GIN[59] , PHI , POUT[51] , GOUT[59] );
endmodule

module DBLC_3_64 ( PIN, GIN, PHI, POUT, GOUT );
input  [51:0] PIN;
input  [59:0] GIN;
input  PHI;
output [43:0] POUT;
output [59:0] GOUT;
   INVBLOCK U10 (GIN[0] , PHI , GOUT[0] );
   INVBLOCK U11 (GIN[1] , PHI , GOUT[1] );
   INVBLOCK U12 (GIN[2] , PHI , GOUT[2] );
   INVBLOCK U13 (GIN[3] , PHI , GOUT[3] );
   INVBLOCK U14 (GIN[4] , PHI , GOUT[4] );
   INVBLOCK U15 (GIN[5] , PHI , GOUT[5] );
   INVBLOCK U16 (GIN[6] , PHI , GOUT[6] );
   INVBLOCK U17 (GIN[7] , PHI , GOUT[7] );
   BLOCK2A U28 (PIN[0] , GIN[0] , GIN[8] , PHI , GOUT[8] );
   BLOCK2A U29 (PIN[1] , GIN[1] , GIN[9] , PHI , GOUT[9] );
   BLOCK2A U210 (PIN[2] , GIN[2] , GIN[10] , PHI , GOUT[10] );
   BLOCK2A U211 (PIN[3] , GIN[3] , GIN[11] , PHI , GOUT[11] );
   BLOCK2A U212 (PIN[4] , GIN[4] , GIN[12] , PHI , GOUT[12] );
   BLOCK2A U213 (PIN[5] , GIN[5] , GIN[13] , PHI , GOUT[13] );
   BLOCK2A U214 (PIN[6] , GIN[6] , GIN[14] , PHI , GOUT[14] );
   BLOCK2A U215 (PIN[7] , GIN[7] , GIN[15] , PHI , GOUT[15] );
   BLOCK2 U316 (PIN[0] , PIN[8] , GIN[8] , GIN[16] , PHI , POUT[0] , GOUT[16] );
   BLOCK2 U317 (PIN[1] , PIN[9] , GIN[9] , GIN[17] , PHI , POUT[1] , GOUT[17] );
   BLOCK2 U318 (PIN[2] , PIN[10] , GIN[10] , GIN[18] , PHI , POUT[2] , GOUT[18] );
   BLOCK2 U319 (PIN[3] , PIN[11] , GIN[11] , GIN[19] , PHI , POUT[3] , GOUT[19] );
   BLOCK2 U320 (PIN[4] , PIN[12] , GIN[12] , GIN[20] , PHI , POUT[4] , GOUT[20] );
   BLOCK2 U321 (PIN[5] , PIN[13] , GIN[13] , GIN[21] , PHI , POUT[5] , GOUT[21] );
   BLOCK2 U322 (PIN[6] , PIN[14] , GIN[14] , GIN[22] , PHI , POUT[6] , GOUT[22] );
   BLOCK2 U323 (PIN[7] , PIN[15] , GIN[15] , GIN[23] , PHI , POUT[7] , GOUT[23] );
   BLOCK2 U324 (PIN[8] , PIN[16] , GIN[16] , GIN[24] , PHI , POUT[8] , GOUT[24] );
   BLOCK2 U325 (PIN[9] , PIN[17] , GIN[17] , GIN[25] , PHI , POUT[9] , GOUT[25] );
   BLOCK2 U326 (PIN[10] , PIN[18] , GIN[18] , GIN[26] , PHI , POUT[10] , GOUT[26] );
   BLOCK2 U327 (PIN[11] , PIN[19] , GIN[19] , GIN[27] , PHI , POUT[11] , GOUT[27] );
   BLOCK2 U328 (PIN[12] , PIN[20] , GIN[20] , GIN[28] , PHI , POUT[12] , GOUT[28] );
   BLOCK2 U329 (PIN[13] , PIN[21] , GIN[21] , GIN[29] , PHI , POUT[13] , GOUT[29] );
   BLOCK2 U330 (PIN[14] , PIN[22] , GIN[22] , GIN[30] , PHI , POUT[14] , GOUT[30] );
   BLOCK2 U331 (PIN[15] , PIN[23] , GIN[23] , GIN[31] , PHI , POUT[15] , GOUT[31] );
   BLOCK2 U332 (PIN[16] , PIN[24] , GIN[24] , GIN[32] , PHI , POUT[16] , GOUT[32] );
   BLOCK2 U333 (PIN[17] , PIN[25] , GIN[25] , GIN[33] , PHI , POUT[17] , GOUT[33] );
   BLOCK2 U334 (PIN[18] , PIN[26] , GIN[26] , GIN[34] , PHI , POUT[18] , GOUT[34] );
   BLOCK2 U335 (PIN[19] , PIN[27] , GIN[27] , GIN[35] , PHI , POUT[19] , GOUT[35] );
   BLOCK2 U336 (PIN[20] , PIN[28] , GIN[28] , GIN[36] , PHI , POUT[20] , GOUT[36] );
   BLOCK2 U337 (PIN[21] , PIN[29] , GIN[29] , GIN[37] , PHI , POUT[21] , GOUT[37] );
   BLOCK2 U338 (PIN[22] , PIN[30] , GIN[30] , GIN[38] , PHI , POUT[22] , GOUT[38] );
   BLOCK2 U339 (PIN[23] , PIN[31] , GIN[31] , GIN[39] , PHI , POUT[23] , GOUT[39] );
   BLOCK2 U340 (PIN[24] , PIN[32] , GIN[32] , GIN[40] , PHI , POUT[24] , GOUT[40] );
   BLOCK2 U341 (PIN[25] , PIN[33] , GIN[33] , GIN[41] , PHI , POUT[25] , GOUT[41] );
   BLOCK2 U342 (PIN[26] , PIN[34] , GIN[34] , GIN[42] , PHI , POUT[26] , GOUT[42] );
   BLOCK2 U343 (PIN[27] , PIN[35] , GIN[35] , GIN[43] , PHI , POUT[27] , GOUT[43] );
   BLOCK2 U344 (PIN[28] , PIN[36] , GIN[36] , GIN[44] , PHI , POUT[28] , GOUT[44] );
   BLOCK2 U345 (PIN[29] , PIN[37] , GIN[37] , GIN[45] , PHI , POUT[29] , GOUT[45] );
   BLOCK2 U346 (PIN[30] , PIN[38] , GIN[38] , GIN[46] , PHI , POUT[30] , GOUT[46] );
   BLOCK2 U347 (PIN[31] , PIN[39] , GIN[39] , GIN[47] , PHI , POUT[31] , GOUT[47] );
   BLOCK2 U348 (PIN[32] , PIN[40] , GIN[40] , GIN[48] , PHI , POUT[32] , GOUT[48] );
   BLOCK2 U349 (PIN[33] , PIN[41] , GIN[41] , GIN[49] , PHI , POUT[33] , GOUT[49] );
   BLOCK2 U350 (PIN[34] , PIN[42] , GIN[42] , GIN[50] , PHI , POUT[34] , GOUT[50] );
   BLOCK2 U351 (PIN[35] , PIN[43] , GIN[43] , GIN[51] , PHI , POUT[35] , GOUT[51] );
   BLOCK2 U352 (PIN[36] , PIN[44] , GIN[44] , GIN[52] , PHI , POUT[36] , GOUT[52] );
   BLOCK2 U353 (PIN[37] , PIN[45] , GIN[45] , GIN[53] , PHI , POUT[37] , GOUT[53] );
   BLOCK2 U354 (PIN[38] , PIN[46] , GIN[46] , GIN[54] , PHI , POUT[38] , GOUT[54] );
   BLOCK2 U355 (PIN[39] , PIN[47] , GIN[47] , GIN[55] , PHI , POUT[39] , GOUT[55] );
   BLOCK2 U356 (PIN[40] , PIN[48] , GIN[48] , GIN[56] , PHI , POUT[40] , GOUT[56] );
   BLOCK2 U357 (PIN[41] , PIN[49] , GIN[49] , GIN[57] , PHI , POUT[41] , GOUT[57] );
   BLOCK2 U358 (PIN[42] , PIN[50] , GIN[50] , GIN[58] , PHI , POUT[42] , GOUT[58] );
   BLOCK2 U359 (PIN[43] , PIN[51] , GIN[51] , GIN[59] , PHI , POUT[43] , GOUT[59] );
endmodule


module DBLC_4_64 ( PIN, GIN, PHI, POUT, GOUT );
input  [43:0] PIN;
input  [59:0] GIN;
input  PHI;
output [27:0] POUT;
output [59:0] GOUT;
   INVBLOCK U10 (GIN[0] , PHI , GOUT[0] );
   INVBLOCK U11 (GIN[1] , PHI , GOUT[1] );
   INVBLOCK U12 (GIN[2] , PHI , GOUT[2] );
   INVBLOCK U13 (GIN[3] , PHI , GOUT[3] );
   INVBLOCK U14 (GIN[4] , PHI , GOUT[4] );
   INVBLOCK U15 (GIN[5] , PHI , GOUT[5] );
   INVBLOCK U16 (GIN[6] , PHI , GOUT[6] );
   INVBLOCK U17 (GIN[7] , PHI , GOUT[7] );
   INVBLOCK U18 (GIN[8] , PHI , GOUT[8] );
   INVBLOCK U19 (GIN[9] , PHI , GOUT[9] );
   INVBLOCK U110 (GIN[10] , PHI , GOUT[10] );
   INVBLOCK U111 (GIN[11] , PHI , GOUT[11] );
   INVBLOCK U112 (GIN[12] , PHI , GOUT[12] );
   INVBLOCK U113 (GIN[13] , PHI , GOUT[13] );
   INVBLOCK U114 (GIN[14] , PHI , GOUT[14] );
   INVBLOCK U115 (GIN[15] , PHI , GOUT[15] );
   BLOCK1A U216 (PIN[0] , GIN[0] , GIN[16] , PHI , GOUT[16] );
   BLOCK1A U217 (PIN[1] , GIN[1] , GIN[17] , PHI , GOUT[17] );
   BLOCK1A U218 (PIN[2] , GIN[2] , GIN[18] , PHI , GOUT[18] );
   BLOCK1A U219 (PIN[3] , GIN[3] , GIN[19] , PHI , GOUT[19] );
   BLOCK1A U220 (PIN[4] , GIN[4] , GIN[20] , PHI , GOUT[20] );
   BLOCK1A U221 (PIN[5] , GIN[5] , GIN[21] , PHI , GOUT[21] );
   BLOCK1A U222 (PIN[6] , GIN[6] , GIN[22] , PHI , GOUT[22] );
   BLOCK1A U223 (PIN[7] , GIN[7] , GIN[23] , PHI , GOUT[23] );
   BLOCK1A U224 (PIN[8] , GIN[8] , GIN[24] , PHI , GOUT[24] );
   BLOCK1A U225 (PIN[9] , GIN[9] , GIN[25] , PHI , GOUT[25] );
   BLOCK1A U226 (PIN[10] , GIN[10] , GIN[26] , PHI , GOUT[26] );
   BLOCK1A U227 (PIN[11] , GIN[11] , GIN[27] , PHI , GOUT[27] );
   BLOCK1A U228 (PIN[12] , GIN[12] , GIN[28] , PHI , GOUT[28] );
   BLOCK1A U229 (PIN[13] , GIN[13] , GIN[29] , PHI , GOUT[29] );
   BLOCK1A U230 (PIN[14] , GIN[14] , GIN[30] , PHI , GOUT[30] );
   BLOCK1A U231 (PIN[15] , GIN[15] , GIN[31] , PHI , GOUT[31] );
   BLOCK1 U332 (PIN[0] , PIN[16] , GIN[16] , GIN[32] , PHI , POUT[0] , GOUT[32] );
   BLOCK1 U333 (PIN[1] , PIN[17] , GIN[17] , GIN[33] , PHI , POUT[1] , GOUT[33] );
   BLOCK1 U334 (PIN[2] , PIN[18] , GIN[18] , GIN[34] , PHI , POUT[2] , GOUT[34] );
   BLOCK1 U335 (PIN[3] , PIN[19] , GIN[19] , GIN[35] , PHI , POUT[3] , GOUT[35] );
   BLOCK1 U336 (PIN[4] , PIN[20] , GIN[20] , GIN[36] , PHI , POUT[4] , GOUT[36] );
   BLOCK1 U337 (PIN[5] , PIN[21] , GIN[21] , GIN[37] , PHI , POUT[5] , GOUT[37] );
   BLOCK1 U338 (PIN[6] , PIN[22] , GIN[22] , GIN[38] , PHI , POUT[6] , GOUT[38] );
   BLOCK1 U339 (PIN[7] , PIN[23] , GIN[23] , GIN[39] , PHI , POUT[7] , GOUT[39] );
   BLOCK1 U340 (PIN[8] , PIN[24] , GIN[24] , GIN[40] , PHI , POUT[8] , GOUT[40] );
   BLOCK1 U341 (PIN[9] , PIN[25] , GIN[25] , GIN[41] , PHI , POUT[9] , GOUT[41] );
   BLOCK1 U342 (PIN[10] , PIN[26] , GIN[26] , GIN[42] , PHI , POUT[10] , GOUT[42] );
   BLOCK1 U343 (PIN[11] , PIN[27] , GIN[27] , GIN[43] , PHI , POUT[11] , GOUT[43] );
   BLOCK1 U344 (PIN[12] , PIN[28] , GIN[28] , GIN[44] , PHI , POUT[12] , GOUT[44] );
   BLOCK1 U345 (PIN[13] , PIN[29] , GIN[29] , GIN[45] , PHI , POUT[13] , GOUT[45] );
   BLOCK1 U346 (PIN[14] , PIN[30] , GIN[30] , GIN[46] , PHI , POUT[14] , GOUT[46] );
   BLOCK1 U347 (PIN[15] , PIN[31] , GIN[31] , GIN[47] , PHI , POUT[15] , GOUT[47] );
   BLOCK1 U348 (PIN[16] , PIN[32] , GIN[32] , GIN[48] , PHI , POUT[16] , GOUT[48] );
   BLOCK1 U349 (PIN[17] , PIN[33] , GIN[33] , GIN[49] , PHI , POUT[17] , GOUT[49] );
   BLOCK1 U350 (PIN[18] , PIN[34] , GIN[34] , GIN[50] , PHI , POUT[18] , GOUT[50] );
   BLOCK1 U351 (PIN[19] , PIN[35] , GIN[35] , GIN[51] , PHI , POUT[19] , GOUT[51] );
   BLOCK1 U352 (PIN[20] , PIN[36] , GIN[36] , GIN[52] , PHI , POUT[20] , GOUT[52] );
   BLOCK1 U353 (PIN[21] , PIN[37] , GIN[37] , GIN[53] , PHI , POUT[21] , GOUT[53] );
   BLOCK1 U354 (PIN[22] , PIN[38] , GIN[38] , GIN[54] , PHI , POUT[22] , GOUT[54] );
   BLOCK1 U355 (PIN[23] , PIN[39] , GIN[39] , GIN[55] , PHI , POUT[23] , GOUT[55] );
   BLOCK1 U356 (PIN[24] , PIN[40] , GIN[40] , GIN[56] , PHI , POUT[24] , GOUT[56] );
   BLOCK1 U357 (PIN[25] , PIN[41] , GIN[41] , GIN[57] , PHI , POUT[25] , GOUT[57] );
   BLOCK1 U358 (PIN[26] , PIN[42] , GIN[42] , GIN[58] , PHI , POUT[26] , GOUT[58] );
   BLOCK1 U359 (PIN[27] , PIN[43] , GIN[43] , GIN[59] , PHI , POUT[27] , GOUT[59] );
endmodule

module DBLC_5_64 ( PIN, GIN, PHI, POUT, GOUT );
input  [27:0] PIN;
input  [59:0] GIN;
input  PHI;
output [0:0] POUT;
output [59:0] GOUT;
   INVBLOCK U10 (GIN[0] , PHI , GOUT[0] );
   INVBLOCK U11 (GIN[1] , PHI , GOUT[1] );
   INVBLOCK U12 (GIN[2] , PHI , GOUT[2] );
   INVBLOCK U13 (GIN[3] , PHI , GOUT[3] );
   INVBLOCK U14 (GIN[4] , PHI , GOUT[4] );
   INVBLOCK U15 (GIN[5] , PHI , GOUT[5] );
   INVBLOCK U16 (GIN[6] , PHI , GOUT[6] );
   INVBLOCK U17 (GIN[7] , PHI , GOUT[7] );
   INVBLOCK U18 (GIN[8] , PHI , GOUT[8] );
   INVBLOCK U19 (GIN[9] , PHI , GOUT[9] );
   INVBLOCK U110 (GIN[10] , PHI , GOUT[10] );
   INVBLOCK U111 (GIN[11] , PHI , GOUT[11] );
   INVBLOCK U112 (GIN[12] , PHI , GOUT[12] );
   INVBLOCK U113 (GIN[13] , PHI , GOUT[13] );
   INVBLOCK U114 (GIN[14] , PHI , GOUT[14] );
   INVBLOCK U115 (GIN[15] , PHI , GOUT[15] );
   INVBLOCK U116 (GIN[16] , PHI , GOUT[16] );
   INVBLOCK U117 (GIN[17] , PHI , GOUT[17] );
   INVBLOCK U118 (GIN[18] , PHI , GOUT[18] );
   INVBLOCK U119 (GIN[19] , PHI , GOUT[19] );
   INVBLOCK U120 (GIN[20] , PHI , GOUT[20] );
   INVBLOCK U121 (GIN[21] , PHI , GOUT[21] );
   INVBLOCK U122 (GIN[22] , PHI , GOUT[22] );
   INVBLOCK U123 (GIN[23] , PHI , GOUT[23] );
   INVBLOCK U124 (GIN[24] , PHI , GOUT[24] );
   INVBLOCK U125 (GIN[25] , PHI , GOUT[25] );
   INVBLOCK U126 (GIN[26] , PHI , GOUT[26] );
   INVBLOCK U127 (GIN[27] , PHI , GOUT[27] );
   INVBLOCK U128 (GIN[28] , PHI , GOUT[28] );
   INVBLOCK U129 (GIN[29] , PHI , GOUT[29] );
   INVBLOCK U130 (GIN[30] , PHI , GOUT[30] );
   INVBLOCK U131 (GIN[31] , PHI , GOUT[31] );
   BLOCK2A U232 (PIN[0] , GIN[0] , GIN[32] , PHI , GOUT[32] );
   BLOCK2A U233 (PIN[1] , GIN[1] , GIN[33] , PHI , GOUT[33] );
   BLOCK2A U234 (PIN[2] , GIN[2] , GIN[34] , PHI , GOUT[34] );
   BLOCK2A U235 (PIN[3] , GIN[3] , GIN[35] , PHI , GOUT[35] );
   BLOCK2A U236 (PIN[4] , GIN[4] , GIN[36] , PHI , GOUT[36] );
   BLOCK2A U237 (PIN[5] , GIN[5] , GIN[37] , PHI , GOUT[37] );
   BLOCK2A U238 (PIN[6] , GIN[6] , GIN[38] , PHI , GOUT[38] );
   BLOCK2A U239 (PIN[7] , GIN[7] , GIN[39] , PHI , GOUT[39] );
   BLOCK2A U240 (PIN[8] , GIN[8] , GIN[40] , PHI , GOUT[40] );
   BLOCK2A U241 (PIN[9] , GIN[9] , GIN[41] , PHI , GOUT[41] );
   BLOCK2A U242 (PIN[10] , GIN[10] , GIN[42] , PHI , GOUT[42] );
   BLOCK2A U243 (PIN[11] , GIN[11] , GIN[43] , PHI , GOUT[43] );
   BLOCK2A U244 (PIN[12] , GIN[12] , GIN[44] , PHI , GOUT[44] );
   BLOCK2A U245 (PIN[13] , GIN[13] , GIN[45] , PHI , GOUT[45] );
   BLOCK2A U246 (PIN[14] , GIN[14] , GIN[46] , PHI , GOUT[46] );
   BLOCK2A U247 (PIN[15] , GIN[15] , GIN[47] , PHI , GOUT[47] );
   BLOCK2A U248 (PIN[16] , GIN[16] , GIN[48] , PHI , GOUT[48] );
   BLOCK2A U249 (PIN[17] , GIN[17] , GIN[49] , PHI , GOUT[49] );
   BLOCK2A U250 (PIN[18] , GIN[18] , GIN[50] , PHI , GOUT[50] );
   BLOCK2A U251 (PIN[19] , GIN[19] , GIN[51] , PHI , GOUT[51] );
   BLOCK2A U252 (PIN[20] , GIN[20] , GIN[52] , PHI , GOUT[52] );
   BLOCK2A U253 (PIN[21] , GIN[21] , GIN[53] , PHI , GOUT[53] );
   BLOCK2A U254 (PIN[22] , GIN[22] , GIN[54] , PHI , GOUT[54] );
   BLOCK2A U255 (PIN[23] , GIN[23] , GIN[55] , PHI , GOUT[55] );
   BLOCK2A U256 (PIN[24] , GIN[24] , GIN[56] , PHI , GOUT[56] );
   BLOCK2A U257 (PIN[25] , GIN[25] , GIN[57] , PHI , GOUT[57] );
   BLOCK2A U258 (PIN[26] , GIN[26] , GIN[58] , PHI , GOUT[58] );
   BLOCK2 U364 (PIN[0] , PIN[27] , GIN[27] , GIN[59] , PHI , POUT[0] , GOUT[59] );
endmodule


module XORSTAGE_64 ( A, B, PBIT, PHI, CARRY, SUM, COUT );
input  [58:0] A;
input  [58:0] B;
input  PBIT;
input  PHI;
input  [59:0] CARRY;
output [58:0] SUM;
output COUT;
   XXOR1 U20 (A[0] , B[0] , CARRY[0] , PHI , SUM[0] );
   XXOR1 U21 (A[1] , B[1] , CARRY[1] , PHI , SUM[1] );
   XXOR1 U22 (A[2] , B[2] , CARRY[2] , PHI , SUM[2] );
   XXOR1 U23 (A[3] , B[3] , CARRY[3] , PHI , SUM[3] );
   XXOR1 U24 (A[4] , B[4] , CARRY[4] , PHI , SUM[4] );
   XXOR1 U25 (A[5] , B[5] , CARRY[5] , PHI , SUM[5] );
   XXOR1 U26 (A[6] , B[6] , CARRY[6] , PHI , SUM[6] );
   XXOR1 U27 (A[7] , B[7] , CARRY[7] , PHI , SUM[7] );
   XXOR1 U28 (A[8] , B[8] , CARRY[8] , PHI , SUM[8] );
   XXOR1 U29 (A[9] , B[9] , CARRY[9] , PHI , SUM[9] );
   XXOR1 U210 (A[10] , B[10] , CARRY[10] , PHI , SUM[10] );
   XXOR1 U211 (A[11] , B[11] , CARRY[11] , PHI , SUM[11] );
   XXOR1 U212 (A[12] , B[12] , CARRY[12] , PHI , SUM[12] );
   XXOR1 U213 (A[13] , B[13] , CARRY[13] , PHI , SUM[13] );
   XXOR1 U214 (A[14] , B[14] , CARRY[14] , PHI , SUM[14] );
   XXOR1 U215 (A[15] , B[15] , CARRY[15] , PHI , SUM[15] );
   XXOR1 U216 (A[16] , B[16] , CARRY[16] , PHI , SUM[16] );
   XXOR1 U217 (A[17] , B[17] , CARRY[17] , PHI , SUM[17] );
   XXOR1 U218 (A[18] , B[18] , CARRY[18] , PHI , SUM[18] );
   XXOR1 U219 (A[19] , B[19] , CARRY[19] , PHI , SUM[19] );
   XXOR1 U220 (A[20] , B[20] , CARRY[20] , PHI , SUM[20] );
   XXOR1 U221 (A[21] , B[21] , CARRY[21] , PHI , SUM[21] );
   XXOR1 U222 (A[22] , B[22] , CARRY[22] , PHI , SUM[22] );
   XXOR1 U223 (A[23] , B[23] , CARRY[23] , PHI , SUM[23] );
   XXOR1 U224 (A[24] , B[24] , CARRY[24] , PHI , SUM[24] );
   XXOR1 U225 (A[25] , B[25] , CARRY[25] , PHI , SUM[25] );
   XXOR1 U226 (A[26] , B[26] , CARRY[26] , PHI , SUM[26] );
   XXOR1 U227 (A[27] , B[27] , CARRY[27] , PHI , SUM[27] );
   XXOR1 U228 (A[28] , B[28] , CARRY[28] , PHI , SUM[28] );
   XXOR1 U229 (A[29] , B[29] , CARRY[29] , PHI , SUM[29] );
   XXOR1 U230 (A[30] , B[30] , CARRY[30] , PHI , SUM[30] );
   XXOR1 U231 (A[31] , B[31] , CARRY[31] , PHI , SUM[31] );
   XXOR1 U232 (A[32] , B[32] , CARRY[32] , PHI , SUM[32] );
   XXOR1 U233 (A[33] , B[33] , CARRY[33] , PHI , SUM[33] );
   XXOR1 U234 (A[34] , B[34] , CARRY[34] , PHI , SUM[34] );
   XXOR1 U235 (A[35] , B[35] , CARRY[35] , PHI , SUM[35] );
   XXOR1 U236 (A[36] , B[36] , CARRY[36] , PHI , SUM[36] );
   XXOR1 U237 (A[37] , B[37] , CARRY[37] , PHI , SUM[37] );
   XXOR1 U238 (A[38] , B[38] , CARRY[38] , PHI , SUM[38] );
   XXOR1 U239 (A[39] , B[39] , CARRY[39] , PHI , SUM[39] );
   XXOR1 U240 (A[40] , B[40] , CARRY[40] , PHI , SUM[40] );
   XXOR1 U241 (A[41] , B[41] , CARRY[41] , PHI , SUM[41] );
   XXOR1 U242 (A[42] , B[42] , CARRY[42] , PHI , SUM[42] );
   XXOR1 U243 (A[43] , B[43] , CARRY[43] , PHI , SUM[43] );
   XXOR1 U244 (A[44] , B[44] , CARRY[44] , PHI , SUM[44] );
   XXOR1 U245 (A[45] , B[45] , CARRY[45] , PHI , SUM[45] );
   XXOR1 U246 (A[46] , B[46] , CARRY[46] , PHI , SUM[46] );
   XXOR1 U247 (A[47] , B[47] , CARRY[47] , PHI , SUM[47] );
   XXOR1 U248 (A[48] , B[48] , CARRY[48] , PHI , SUM[48] );
   XXOR1 U249 (A[49] , B[49] , CARRY[49] , PHI , SUM[49] );
   XXOR1 U250 (A[50] , B[50] , CARRY[50] , PHI , SUM[50] );
   XXOR1 U251 (A[51] , B[51] , CARRY[51] , PHI , SUM[51] );
   XXOR1 U252 (A[52] , B[52] , CARRY[52] , PHI , SUM[52] );
   XXOR1 U253 (A[53] , B[53] , CARRY[53] , PHI , SUM[53] );
   XXOR1 U254 (A[54] , B[54] , CARRY[54] , PHI , SUM[54] );
   XXOR1 U255 (A[55] , B[55] , CARRY[55] , PHI , SUM[55] );
   XXOR1 U256 (A[56] , B[56] , CARRY[56] , PHI , SUM[56] );
   XXOR1 U257 (A[57] , B[57] , CARRY[57] , PHI , SUM[57] );
   XXOR1 U258 (A[58] , B[58] , CARRY[58] , PHI , SUM[58] );
   BLOCK1A U1 (PBIT , CARRY[0] , CARRY[59] , PHI , COUT );
endmodule


module DBLCTREE_64 ( PIN, GIN, PHI, GOUT, POUT );
input  [58:0] PIN;
input  [59:0] GIN;
input  PHI;
output [59:0] GOUT;
output [0:0] POUT;
   wire [57:0] INTPROP_0;
   wire [59:0] INTGEN_0;
   wire [55:0] INTPROP_1;
   wire [59:0] INTGEN_1;
   wire [51:0] INTPROP_2;
   wire [59:0] INTGEN_2;
   wire [43:0] INTPROP_3;
   wire [59:0] INTGEN_3;
   wire [27:0] INTPROP_4;
   wire [59:0] INTGEN_4;
   DBLC_0_64 U_0 (.PIN(PIN) , .GIN(GIN) , .PHI(PHI) , .POUT(INTPROP_0) , .GOUT(INTGEN_0) );
   DBLC_1_64 U_1 (.PIN(INTPROP_0) , .GIN(INTGEN_0) , .PHI(PHI) , .POUT(INTPROP_1) , .GOUT(INTGEN_1) );
   DBLC_2_64 U_2 (.PIN(INTPROP_1) , .GIN(INTGEN_1) , .PHI(PHI) , .POUT(INTPROP_2) , .GOUT(INTGEN_2) );
   DBLC_3_64 U_3 (.PIN(INTPROP_2) , .GIN(INTGEN_2) , .PHI(PHI) , .POUT(INTPROP_3) , .GOUT(INTGEN_3) );
   DBLC_4_64 U_4 (.PIN(INTPROP_3) , .GIN(INTGEN_3) , .PHI(PHI) , .POUT(INTPROP_4) , .GOUT(INTGEN_4) );
   DBLC_5_64 U_5 (.PIN(INTPROP_4) , .GIN(INTGEN_4) , .PHI(PHI) , .POUT(POUT) , .GOUT(GOUT) );
endmodule


module DBLCADDER_64_64 ( OPA, OPB, CIN, PHI, SUM, COUT );
input  [58:0] OPA;
input  [58:0] OPB;
input  CIN;
input  PHI;
output [58:0] SUM;
output COUT;
   wire [58:0] INTPROP;
   wire [59:0] INTGEN;
   wire [0:0] PBIT;
   wire [59:0] CARRY;
   PRESTAGE_64 U1 (OPA , OPB , CIN , PHI , INTPROP , INTGEN );
   DBLCTREE_64 U2 (INTPROP , INTGEN , PHI , CARRY , PBIT );
   XORSTAGE_64 U3 (OPA[58:0] , OPB[58:0] , PBIT[0] , PHI , CARRY[59:0] , SUM , COUT );
endmodule

/******************** Booth Selector ********************/
module booth_sel(y2, y1, y0, ty, single, double, triple, quad, neg, p);

input y2;

input y1;

input y0;

input ty;

input single;

input double;

input triple;

input quad;

input neg;

output p;

assign  p = (neg ^ ((y2 & single)|(ty & triple)| (y1 & double) | (y0 & quad)));

endmodule
/******************** 1bit Full Adder ********************/

module FULL_ADDER ( a, b, cin, sum, cout );

input  a;

input  b;

input  cin;

output sum;

output cout;

   wire TMP;

   assign TMP = a ^ b;

   assign sum = TMP ^ cin;

   assign cout =  ~ (( ~ (TMP & cin)) & ( ~ (a & b)));

endmodule
 
module HALF_ADDER ( a, b, sum, cout );

input  a;

input  b;

output sum;

output cout;

   assign sum = a ^ b;

   assign cout = a & b;

endmodule


