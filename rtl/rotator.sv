import fft_pkg::twiddle_t;
import fft_pkg::TWIDDLE_POWER;
import fft_pkg::DATA_WIDTH;

module rotator (
    input  logic        clk    ,
    input  logic        sw     ,
    input  logic [DATA_WIDTH-1:0] din    ,
    input  twiddle_t    twiddle,
    output logic [DATA_WIDTH-1:0] dout
);

    logic [1:0][15:0] r_din;
    always_ff @(posedge clk) r_din <= { r_din[0], din };

    logic [15:0] mux;
    assign mux = sw ? din : r_din[1];

    logic [DATA_WIDTH+TWIDDLE_POWER-1-1:0] m_cos;
    logic [DATA_WIDTH-1:0] m_cos_restricted;
    assign m_cos = $signed(r_din[0]) * $signed(twiddle.cos);
    assign m_cos_restricted = $signed(m_cos[$bits(m_cos)-1:(TWIDDLE_POWER - 1)]);

    logic [DATA_WIDTH+TWIDDLE_POWER-1:0] m_sin;
    logic [DATA_WIDTH-1:0] m_sin_restricted;
    assign m_sin = $signed(mux) * $signed(twiddle.sin);
    assign m_sin_restricted = $signed(m_sin[$bits(m_cos)-1:(TWIDDLE_POWER - 1)]);

    logic [DATA_WIDTH:0] sum;
    assign sum = sw ? ($signed(m_cos_restricted) - $signed(m_sin_restricted)) : ($signed(m_cos_restricted) + $signed(m_sin_restricted));

    assign dout = sum[$bits(sum)-2:0];

endmodule
