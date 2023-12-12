module gates(input wire a, b, output wire and_out, or_out, not_out, nand_out, nor_out, xor_out, xnor_out);
    // AND gate
    assign and_out = a & b;

    // OR gate
    assign or_out = a | b;

    // NOT gate
    assign not_out = ~a;

    // NAND gate
    assign nand_out = ~(a & b);

    // NOR gate
    assign nor_out = ~(a | b);

    // XOR gate
    assign xor_out = a ^ b;

    // XNOR gate
    assign xnor_out = ~(a ^ b);
endmodule
