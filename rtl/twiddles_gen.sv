import fft_pkg::twiddle_t;

module twiddles_gen #(parameter int unsigned FFT_SIZE = 16) (
    input  logic                                                  clk     ,
    input  logic     [$clog2(FFT_SIZE)-2:0][$clog2(FFT_SIZE)-2:0] indexes ,
    output twiddle_t [$clog2(FFT_SIZE)-2:0]                       twiddles
);

    localparam int unsigned TOTAL_TWIDDLES = FFT_SIZE/2;

    twiddle_t [TOTAL_TWIDDLES-1:0] twiddles_storage;

    initial begin
        for (int i = 0; i < TOTAL_TWIDDLES; i = i + 1) begin
            twiddles_storage[i].cos = $cos( 2 * 3.1416 * i / FFT_SIZE) * 256;
            twiddles_storage[i].sin = $sin(-2 * 3.1416 * i / FFT_SIZE) * 256;
        end
    end

    generate
        for (genvar i = 0; i < $clog2(FFT_SIZE)-1; i = i + 1) begin
            always_ff @(posedge clk) twiddles[i] <= twiddles_storage[indexes[i]];
        end
    endgenerate





endmodule
