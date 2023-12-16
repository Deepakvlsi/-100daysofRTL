module Encoder_8to3 (input [7:0] data_in, output reg [2:0] encoded_output);

always @* begin
  case (data_in)
    8'b00000001: encoded_output = 3'b000;
    8'b00000010: encoded_output = 3'b001;
    8'b00000100: encoded_output = 3'b010;
    8'b00001000: encoded_output = 3'b011;
    8'b00010000: encoded_output = 3'b100;
    8'b00100000: encoded_output = 3'b101;
    8'b01000000: encoded_output = 3'b110;
    8'b10000000: encoded_output = 3'b111;
    default:      encoded_output = 3'b000; // Default case, you can choose another value if needed
  endcase
end

endmodule
