// project: electronic keyboard
// author: cw1997
// 2019/5/20 23:53
// repo: https://github.com/cw1997/electronic-keyboard

module beep(
	input clk,
	input rst_n,
	input[7:0] key,
	output[7:0] led,
	output[4:1] gpio,
	output beep
);

	wire output_clk;
	reg[2:0] pitch;
	
	wire press;
	assign press = ~(key == 8'b11111111);
	
	assign gpio[2] = 0;
	assign gpio[4] = 0;
	assign gpio[1] = press;
	assign gpio[3] = beep;
	
	assign led = key;
	assign beep = press & output_clk;

	beep_clk(
		clk,
		rst_n,
		pitch,
		output_clk
	);
	
	always @(key) begin
		case (key) 
			8'b11111110 : pitch <= 1;
			8'b11111101 : pitch <= 2;
			8'b11111011 : pitch <= 3;
			8'b11110111 : pitch <= 4;
			8'b11101111 : pitch <= 5;
			8'b11011111 : pitch <= 6;
			8'b10111111 : pitch <= 7;
			8'b01111111 : pitch <= 0;
		endcase
	end

endmodule
