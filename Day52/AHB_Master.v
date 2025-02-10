module AHB_Master (
    input wire HCLK,        // AHB Clock
    input wire HRESETn,     // Active-low reset
    input wire HREADY,      // Slave ready signal
    input wire [31:0] HRDATA,  // Read data from slave
    input wire [1:0] HRESP,  // Response from slave
    output reg [31:0] HADDR, // Address bus
    output reg [31:0] HWDATA, // Write data bus
    output reg [1:0] HTRANS, // Transfer type
    output reg HWRITE,      // Write enable
    output reg [2:0] HSIZE, // Transfer size
    output reg [2:0] HBURST, // Burst type
    output reg [3:0] HPROT   // Protection bits
);

    typedef enum reg [1:0] {IDLE, BUSY, NONSEQ, SEQ} HTRANS_TYPE;
    
    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            HADDR   <= 32'b0;
            HWDATA  <= 32'b0;
            HTRANS  <= IDLE;
            HWRITE  <= 1'b0;
            HSIZE   <= 3'b010; // Default word size (32-bit)
            HBURST  <= 3'b000; // Single transfer
            HPROT   <= 4'b0011; // Default protection
        end else if (HREADY) begin
            // Simple Write Operation Example
            HADDR   <= 32'h1000_0000; // Example address
            HWDATA  <= 32'hDEADBEEF; // Example data
            HTRANS  <= NONSEQ;
            HWRITE  <= 1'b1;
        end
    end
endmodule
