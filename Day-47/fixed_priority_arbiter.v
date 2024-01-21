`timescale 1ns / 1ps

module Fixed_Priority_Arbiter  #(parameter NumRequests=4)(
  input [NumRequests-1:0] request,
  output [NumRequests-1:0] grant
);
    assign grant[NumRequests-1] = request[NumRequests-1];
    genvar i;

    for (i = NumRequests-2; i >=0; i = i - 1) begin
      assign grant[i] = request [i] && (~(|(request[NumRequests-1:i+1])));
    end

endmodule
