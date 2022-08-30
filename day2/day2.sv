// D type Flip-Flop

module day2 (
  input  wire        clk,
  input  wire        reset_n,
  input  wire  [3:0] d_i,

  output logic [3:0] q_no_rst,
  output logic [3:0] q_sync_rst,
  output logic [3:0] q_async_rst
);
  // No Reset
  always_ff @(posedge clk)
    q_no_rst      <= d_i;

  // Sync Reset
  always_ff @(posedge clk) begin
    if (!reset_n)
      q_sync_rst  <= 0;
    else
      q_sync_rst  <= d_i;
  end

  // Async Reset
  always_ff @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      q_sync_rst  <= 0;
    else
      q_async_rst <= d_i;
  end

endmodule