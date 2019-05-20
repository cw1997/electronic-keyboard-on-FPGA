// project: electronic keyboard
// author: cw1997
// 2019/5/20 23:46
// repo: https://github.com/cw1997/electronic-keyboard

module beep_clk(
	input clk,
	input rst_n,
	input[2:0] pitch,
	output reg output_clk
);
	
	parameter clk_freq = 50_000_000 / 2;
	localparam 
	c5 = clk_freq / 523,
	d5 = clk_freq / 587,
	e5 = clk_freq / 659,
	f5 = clk_freq / 698,
	g5 = clk_freq / 783,
	a5 = clk_freq / 880,
	b5 = clk_freq / 987,
	a4 = clk_freq / 440;
	
	reg[31:0] div;
	
	reg[31:0] cnt;

	always @(posedge clk or negedge rst_n)
	begin
		// div freq
		if (!rst_n) begin
			cnt <= 0; 
			output_clk <= 0;
		end
		else if (cnt >= div) begin
			output_clk <= ~output_clk;
			cnt <= 0;
		end
		else begin
			cnt <= cnt + 1;
		end
		
		case (pitch)
			4'd0 : div <= a4;
			4'd1 : div <= c5;
			4'd2 : div <= d5;
			4'd3 : div <= e5;
			4'd4 : div <= f5;
			4'd5 : div <= g5;
			4'd6 : div <= a5;
			4'd7 : div <= b5;
			default : begin
				cnt <= 0; 
				output_clk <= 0;
			end
		endcase
	end

endmodule