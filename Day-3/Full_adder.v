module full_adder(input wire a, b, cin, output wire sum, cout);
    wire sum1, carry1, carry2;

    // First half adder
    assign sum1 = a ^ b;
    assign carry1 = a & b;

    // Second half adder
    assign sum = sum1 ^ cin;
    assign carry2 = sum1 & cin;

    // OR gate for carry out
    assign cout = carry1 | carry2;
endmodule
