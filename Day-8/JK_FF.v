module jk_flip_flop (
  input J,
  input K, 
  input CLK, 
  input RST, 
  output reg Q, 
  output reg Qn 
);

  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      Q <= 1'b0; 
      Qn <= 1'b1; 
    end else begin
      case ({J, K})
        2'b00: begin 
          Q <= Q;
          Qn <= Qn;
        end
        2'b01: begin 
          Q <= 1'b0;
          Qn <= 1'b1;
        end
        2'b10: begin 
          Q <= 1'b1;
          Qn <= 1'b0;
        end
        2'b11: begin 
          Q <= ~Q;
          Qn <= ~Qn;
        end
      endcase
    end
  end

endmodule
