module Decoder_3to8 (
  input [2:0] data_in,
  output reg [7:0] decoded_output
);

always @* begin
  case (data_in)
    3'b000: decoded_output = 8'b00000001;
    3'b001: decoded_output = 8'b00000010;
    3'b010: decoded_output = 8'b00000100;
    3'b011: decoded_output = 8'b00001000;
    3'b100: decoded_output = 8'b00010000;
    3'b101: decoded_output = 8'b00100000;
    3'b110: decoded_output = 8'b01000000;
    3'b111: decoded_output = 8'b10000000;
    default: decoded_output = 8'b00000000; // Default case, you can choose another value if needed
  endcase
end

endmodule
