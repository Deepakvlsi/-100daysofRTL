module cla4bit_full_adder (
    input [3:0] a, b,  // 4-bit inputs
    input cin,         // Carry-in
    output [3:0] sum,   // 4-bit sum
    output cout         // Carry-out
);

// Generate and Propagate signals
wire [3:0] generate, propagate;
assign generate = a & b;
assign propagate = a | b;

// Sum and Carry expressions
assign sum = a ^ b ^ cin;
assign cout = generate[3] | (propagate[3] & cin);

endmodule
