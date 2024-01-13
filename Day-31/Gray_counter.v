module gray_counter(clk,reset,enable,out);

        input clk,reset,enable;
        output [7:0] out;
        reg [7:0] count;
        
        always@(posedge clk)
        if(reset)
            begin
            count <= 0;
            end
         else
            if(enable)
            begin
            count <= count + 1;
            end
         
         assign out = {count[7],(count[7] ^ count[6]),(count[6] ^ count[5]),(count[5] ^ count[4]),
                       (count[4] ^ count[3]),(count[3] ^ count[2]),(count[2] ^ count[1]),
                       (count[1] ^ count[0])};
         
            
endmodule
