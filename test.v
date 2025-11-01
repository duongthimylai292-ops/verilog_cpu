`timescale 1ns/1ps
module tb;
    reg clk, rstn, en;
    reg [7:0] d;
    wire [7:0] q;

    reg8_mux_dff U (.clk(clk), .rstn(rstn), .en(en), .d(d), .q(q));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rstn = 0; en = 0; d = 8'h00;
        #12 rstn = 1;
        #8 en = 1; d = 8'hA5;
        #10 en = 0; d = 8'h00;
        #30 en = 1; d = 8'h3C;
        #20 en = 0; d = 8'hFF;
        #20 $finish;
    end
endmodule