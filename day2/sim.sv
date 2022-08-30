module sim();
  logic       clk;
  logic       reset_n;
  logic [3:0] d_i;

  logic [3:0] q_no_rst;
  logic [3:0] q_sync_rst;
  logic [3:0] q_async_rst;

  day2 day2(.*);

  initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0,sim);
    #1;
  end
endmodule