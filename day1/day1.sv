// A simple mux

module day1 (
    input  wire [7:0] a_i,
    input  wire [7:0] b_i,
    input  wire       sel_i,
    output wire [7:0] out_o
);

    assign out_o = sel_i ? b_i : a_i;
endmodule