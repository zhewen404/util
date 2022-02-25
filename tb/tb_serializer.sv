
`timescale 1ns/1ns
`include "serializer.sv"
module tb_serializer ();

    logic   clk;
    logic   rst_n;
    logic   load_en;
    logic clr;
    logic signed    [32-1 : 0] i_data [16-1 : 0];
    logic signed  [32-1 : 0] o_data;

	serializer U_ser(
        .clk(clk),
        .rst_n(rst_n),
        .load_en(load_en),
	.clr(clr),
        .i_data(i_data),
	.o_data(o_data)
        );

    // clk define
    always #5 clk = ~clk;


    initial
    begin
        clk = 1;
        rst_n = 0;
        load_en = 1;
	clr = '0;
	i_data = {32'b1, 32'd2, 32'd3, 32'd4, 32'd5, 32'd6, 32'd7, 32'd8, 32'd9, 32'd10, 32'd11, 32'd12, 32'd13, 32'd14, 32'd15, 32'd16};
	
        #15;
        rst_n = 1;
	@(posedge clk);        
	@(negedge clk);
	load_en = 0;
        #400;
        $finish;
    end

endmodule