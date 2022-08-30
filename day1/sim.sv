module sim();
    logic [7:0] a_i;
    logic [7:0] b_i;
    logic       sel_i;
    logic [7:0] out_o;

    day1 DAY1(.*);

    initial
        begin
            $dumpfile("sim.vcd");
            $dumpvars(0,sim);
            #1;
        end
endmodule