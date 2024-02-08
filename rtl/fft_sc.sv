import fft_pkg::complex_t;
import fft_pkg::twiddle_t;

import fft_pkg::DATA_WIDTH;

module fft_sc #(parameter int unsigned FFT_SIZE = 16) (
    input  logic                  clk       ,
    input  logic [DATA_WIDTH-1:0] din_re    ,
    input  logic [DATA_WIDTH-1:0] din_im    ,
    input  logic                  din_valid ,
    output logic [DATA_WIDTH-1:0] dout_re   ,
    output logic [DATA_WIDTH-1:0] dout_im   ,
    output logic                  dout_valid
);

    localparam int unsigned TOTAL_STAGES = $clog2(FFT_SIZE);

    complex_t din        ;
    logic     r_din_valid;

    always_ff @(posedge clk) begin
        din.re <= din_re;
        din.im <= din_im;

        r_din_valid <= din_valid;
    end

    complex_t dout_reordered;
    assign dout_re = dout_reordered.re;
    assign dout_im = dout_reordered.im;

    logic [$clog2(FFT_SIZE)-1:0] counter = { $clog2(FFT_SIZE) {1'b1} };
    always_ff @(posedge clk) begin
        if (din_valid) counter <= counter + 1'b1;
        else counter <= {$clog2(FFT_SIZE) {1'b1}};
    end

    logic swro_in;
    assign swro_in = ~counter[$bits(counter) - 1] | counter[0];

    logic     [$clog2(FFT_SIZE)-1:0][$clog2(FFT_SIZE)-2:0] twiddle_indexes;
    twiddle_t [$clog2(FFT_SIZE)-1:0]                       twiddles       ;

    complex_t [TOTAL_STAGES:0] data ;
    logic     [TOTAL_STAGES:0] valid;

    reorder #(.LENGTH(FFT_SIZE/2-1)) in_reorder (
        .clk       (clk        ),
        .sw        (swro_in    ),
        .din       (din        ),
        .dout      (data[0]    ),
        .din_valid (r_din_valid),
        .dout_valid(valid[0]   )
    );

    genvar i;
    generate
        for (i = 0; i < TOTAL_STAGES; i = i + 1) begin : GEN_STAGES
            stage #(
                .FFT_SIZE (FFT_SIZE),
                .NUM_STAGE(i + 1),
                .INCLUDE_PROC(1)
            ) stage (
                .clk          (clk      ),
                .din          (data[i]  ),
                .din_valid    (valid[i] ),
                .dout         (data[i+1]),
                .dout_valid   (valid[i+1]),
                .twiddle_index(twiddle_indexes[i]),
                .twiddle      (twiddles[i])
            );
        end
    endgenerate

    out_reorder #(.FFT_SIZE(FFT_SIZE)) out_reorder (
        .clk       (clk                 ),
        .din       (data[TOTAL_STAGES]  ),
        .din_valid (valid[TOTAL_STAGES] ),
        .dout      (dout_reordered      ),
        .dout_valid(dout_valid          )
    );

    twiddles_gen #(.FFT_SIZE(FFT_SIZE)) twiddles_storage (
        .clk     (clk            ),
        .indexes (twiddle_indexes),
        .twiddles(twiddles       )
    );

endmodule
