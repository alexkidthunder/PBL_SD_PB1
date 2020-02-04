
module initialize_lcd (
	dataa,
	datab,
	result,
	clk,
	clk_en,
	start,
	reset,
	done,
	lcd_enable,
	lcd_rs,
	lcd_rw,
	lcd_data
);

input [31:0] dataa;
input [31:0] datab; //enable
input clk;
input clk_en;
input start;
input reset;
output reg [31:0] result;
output reg done;

output reg lcd_rs;
output lcd_rw;
output reg [7:0] lcd_data;
output reg lcd_enable;

localparam functionSet = 2'b00, EntryMode = 2'b01, Display = 2'b10,  finish = 2'b11;

reg [2:0] state;
reg [23:0] counter = 24'h000000;

assign lcd_rw = 1'b0;

always @ (posedge clk or posedge reset) begin

	if(reset) begin
		counter <= 16'd0;
		state   <= 3'b0;
		lcd_rs  <= 1'b0;
		lcd_enable  <= 1'b0;
		lcd_data  <= 8'b00000000;
	end 
	else begin
				case (state)
					functionSet:begin
						done <= 1'b0;
						lcd_enable <= 1'b0;
						lcd_rs <= 1'b0;
						lcd_data <= 8'b00111000;
						counter <= 16'd0;
						state <= EntryMode;
					end
					EntryMode:begin 
						done <= 1'b0;
						lcd_enable <= 1'b0;
						lcd_rs <= 1'b0;
						lcd_data <= 8'b00000110;
						state <= Display;
					end 
					Display:begin 
						done <= 1'b1;
						lcd_enable <= 1'b1;
						lcd_rs <= 1'b1;
						lcd_data <= 8'b00001111;
						state <= finish;
					end
					finish:begin 
						done <= 1'b1;
						lcd_enable <= 1'b0;
						lcd_rs <= 1'b0;
						result <= 1'b1;
					end
				endcase
		end//2if
	end//else
	
endmodule
