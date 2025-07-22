module fedge (
	input wire clk, asynchIn,
	output wire roll
);

reg a, b, c, falling;

assign roll = falling;

// synch chain
always @ (posedge clk) begin
	a <= asynchIn;
	b <= a;
	c <= b;
end

// falling edge detector
always @ (*) begin
	falling = c & ~b;
end

endmodule 