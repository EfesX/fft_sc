import fft_pkg::twiddle_t;
import fft_pkg::TWIDDLE_WIDTH;
import fft_pkg::DATA_WIDTH;

module rotator #(
    parameter string MULTIPLIERS = "INTEL"// "DIRECT" / "INTEL"
) (
    input  logic                  clk    ,
    input  logic                  sw     ,
    input  logic [DATA_WIDTH-1:0] din    ,
    input  twiddle_t              twiddle,
    output logic [DATA_WIDTH-1:0] dout
);

    logic [1:0][DATA_WIDTH-1:0] r_din;
    always_ff @(posedge clk) r_din <= { r_din[0], din };

    logic [DATA_WIDTH-1:0] mux;
    assign mux = sw ? din : r_din[1];

    logic [DATA_WIDTH+TWIDDLE_WIDTH-1:0] m_cos           ;
    logic [              DATA_WIDTH-1:0] m_cos_restricted;

    assign m_cos_restricted = $signed(m_cos[$bits(m_cos)-2:(TWIDDLE_WIDTH - 1)]);

    logic [DATA_WIDTH+TWIDDLE_WIDTH-1:0] m_sin           ;
    logic [              DATA_WIDTH-1:0] m_sin_restricted;

    assign m_sin_restricted = $signed(m_sin[$bits(m_sin)-2:(TWIDDLE_WIDTH - 1)]);

    generate
        if (MULTIPLIERS == "DIRECT") begin
            assign m_cos = $signed(r_din[0]) * $signed(twiddle.cos);
            assign m_sin = $signed(mux) * $signed(twiddle.sin);
        end

        if (MULTIPLIERS == "INTEL") begin
            lpm_mult	lpm_cos (
                .dataa  (r_din[0]),
                .datab  (twiddle.cos),
                .result (m_cos),
                .aclr   (1'b0),
                .clken  (1'b1),
                .sclr   (1'b0),
                .sum    (1'b0)
            );

            lpm_mult	lpm_sin (
                .dataa  (mux),
                .datab  (twiddle.sin),
                .result (m_sin),
                .aclr   (1'b0),
                .clken  (1'b1),
                .sclr   (1'b0),
                .sum    (1'b0)
            );

            defparam
                lpm_cos.lpm_hint    = "MAXIMIZE_SPEED=9",
                lpm_cos.lpm_representation = "SIGNED",
                lpm_cos.lpm_type    = "LPM_MULT",
                lpm_cos.lpm_widtha  = DATA_WIDTH,
                lpm_cos.lpm_widthb  = TWIDDLE_WIDTH,
                lpm_cos.lpm_widthp  = DATA_WIDTH + TWIDDLE_WIDTH,

                lpm_sin.lpm_hint    = "MAXIMIZE_SPEED=9",
                lpm_sin.lpm_representation = "SIGNED",
                lpm_sin.lpm_type    = "LPM_MULT",
                lpm_sin.lpm_widtha  = DATA_WIDTH,
                lpm_sin.lpm_widthb  = TWIDDLE_WIDTH,
                lpm_sin.lpm_widthp  = DATA_WIDTH + TWIDDLE_WIDTH;
        end
    endgenerate

    logic [DATA_WIDTH:0] sum;
    assign sum = sw ? ($signed(m_cos_restricted) - $signed(m_sin_restricted)) : ($signed(m_cos_restricted) + $signed(m_sin_restricted));

    assign dout = sum[$bits(sum)-2:0];

endmodule
