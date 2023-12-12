module half_adder(input wire a, b, output wire sum, carry);
    // XOR gate for sum
    assign sum = a ^ b;

    // AND gate for carry
    assign carry = a & b;
endmodule
