import fft_pkg::twiddle_t;

module rotator (
    input  logic        clk    ,
    input  logic        sw     ,
    input  logic [15:0] din    ,
    input  twiddle_t    twiddle,
    output logic [15:0] dout
);

    logic [1:0][15:0] r_din;
    always_ff @(posedge clk) r_din <= { r_din[0], din };

    logic [15:0] mux;
    assign mux = sw ? din : r_din[1];

    logic [23:0] m_cos_24;
    logic [15:0] m_cos;
    assign m_cos_24 = $signed(r_din[0]) * $signed(twiddle.cos);
    assign m_cos = m_cos_24[23:8];

    logic [23:0] m_sin_24;
    logic [15:0] m_sin;
    assign m_sin_24 = $signed(mux) * $signed(twiddle.sin);
    assign m_sin = m_sin_24[23:8];

    logic [16:0] sum;
    assign sum = sw ? ($signed(m_cos) - $signed(m_sin)) : ($signed(m_cos) + $signed(m_sin));

    assign dout = sum[15:0];

endmodule
