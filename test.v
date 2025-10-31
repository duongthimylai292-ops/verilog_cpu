`timescale 1ns/100ps
module tb;
    reg clk, d;
    wire q;

    dff uut (.clk(clk), .d(d), .q(q));

    initial begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        clk = 0; d = 0;
        #10 d = 1;
        #10 d = 0;
        #100 $finish;
    end
endmodule