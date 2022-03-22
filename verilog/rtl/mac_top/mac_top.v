`timescale 1ns / 1ps
module mac_top(CLK, RST,mx,my,az,mac);
parameter WIDTH=16;
 `define P_W_0 15
 `define P_W_1 16
parameter group_cnt=(WIDTH>>2)+3;
input wire CLK, RST;
input wire [WIDTH-1:0] mx;
input wire [WIDTH-1:0] my;
input wire [(WIDTH*2)-1:0] az;

output wire [(WIDTH*2)-1:0] mac;

wire [(2*WIDTH)+1:0] tmy;
wire [group_cnt-1:0] s;
wire [group_cnt-1:0] d;
wire [group_cnt-1:0] t;
wire [group_cnt-1:0] q;
wire [group_cnt-1:0] n;
wire [(WIDTH*4)-1:0] product;
reg lsb,msb;

always @(posedge CLK) 
begin
    if (RST) 
	begin
        lsb <= 1'b0;
	end 
	else 
	  begin
		lsb <= RST;
		msb <= product[0];
	 end
    end
pre_process_be uut0 ({{`P_W_0'd0,mx,lsb}}, s, d, t, q, n);
pre_process_TMY uut1 ({`P_W_1'd0,my}, {tmy});
mb32 uut2 (.s(s),.d(d),.t(t),.q(q),.n(n),.my({`P_W_1'd0,my}),.tmy({`P_W_1'd0,tmy[16:0]}),.product(product));
assign mac = az+product[33:1];

endmodule
