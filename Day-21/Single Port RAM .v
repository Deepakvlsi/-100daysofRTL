
`define WIDTH 8
`define DEPTH 16 
`define ADDR $clog2(`DEPTH)

module Single_Port_RAM(
    input clk,
    input enable,
    input read_en, 
    input [(`ADDR-1):0] address,
    input [(`WIDTH-1):0] data_in,
    output reg [(`WIDTH-1):0] data_out
    );
    
    reg [(`WIDTH-1):0] Memory_RAM [(`DEPTH-1):0];
    
    wire write_en;
    assign write_en=~read_en;

    always@(posedge clk) begin
        if(read_en && enable)
            data_out <= Memory_RAM[address];
        else ;
    end

    always@(posedge clk) begin
        if(write_en && enable)
            Memory_RAM[address] <= data_in;
        else;
    end        
    
endmodule
