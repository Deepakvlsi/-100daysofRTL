module mux_4x1 (
    input [3:0] data,
    input [1:0] sel,
    output reg out
);

always @*
    case(sel)
        2'b00: out = data[0];
        2'b01: out = data[1];
        2'b10: out = data[2];
        2'b11: out = data[3];
        default: out = 1'bx;
    endcase

endmodule

module mux_32x1 (
    input [31:0] data,
    input [4:0] sel,
    output reg out
);

reg [3:0] temp[0:7];

generate
    genvar i;
    for (i = 0; i < 8; i = i + 1) begin : mux_instances
        mux_4x1 mux_inst (
            .data(data[i*4 +: 4]),
            .sel(sel[2:1]),
            .out(temp[i])
        );
    end
endgenerate

mux_4x1 final_mux (
    .data(temp),
    .sel(sel[4:3]),
    .out(out)
);

endmodule

