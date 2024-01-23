module traffic_light_controller(
  input clk, rst,
  output reg [1:0] state,
  output reg red, yellow, green
);

  reg [3:0] cnt;

  localparam red_sig = 2'b00, 
              red_yel = 2'b01, 
              grn_sig = 2'b10, 
              grn_yel = 2'b11;

  always @(posedge clk or posedge rst)
    if (rst) begin
      red <= 1;
      yellow <= 0;
      green <= 0;
      state <= red_sig;
      cnt <= 0;
    end 
    else begin
      case(state)
        red_sig: begin
          if (cnt == 10) 
            cnt <= 0;
          else begin
            cnt <= cnt + 1;
            red <= 1; 
            yellow <= 0; 
            green <= 0;
            state <= red_yel;
            #15;
          end
        end

        grn_sig: begin
          red <= 0;
          yellow <= 0; 
          green <= 1;
          state <= grn_yel;
          #8;
        end

        red_yel: begin
          red <= 0; 
          yellow <= 1; 
          green <= 0;
          state <= grn_sig;
          #3;
        end

        grn_yel: begin
          red <= 0; 
          yellow <= 1; 
          green <= 0;
          state <= red_sig;
          #3;
        end

        default: state <= red_sig;
      endcase
    end

  always @(posedge clk)
    if (cnt == 10) cnt <= 0;
    else cnt <= cnt + 1;

endmodule
