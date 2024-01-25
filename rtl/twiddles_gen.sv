import fft_pkg::twiddle_t;
import fft_pkg::TWIDDLE_POWER;

module twiddles_gen #(parameter int unsigned FFT_SIZE = 16) (
    input  logic                                                  clk     ,
    input  logic     [$clog2(FFT_SIZE)-2:0][$clog2(FFT_SIZE)-2:0] indexes ,
    output twiddle_t [$clog2(FFT_SIZE)-2:0]                       twiddles
);

    localparam int unsigned TOTAL_TWIDDLES = FFT_SIZE/2;

    twiddle_t [TOTAL_TWIDDLES-1:0] twiddles_storage;

    initial begin
        
        for (int i = 0; i < TOTAL_TWIDDLES; i = i + 1) begin
            twiddles_storage[i].cos = $cos( 2.0 * 3.141592653589793 * i / FFT_SIZE) * ((2 ** 8) - 1);
            twiddles_storage[i].sin = $sin(-2.0 * 3.141592653589793 * i / FFT_SIZE) * ((2 ** 8) - 1);
        end
        
        /*
        twiddles_storage[0].cos =  1.0000 * ((2 ** 8) - 1);
        twiddles_storage[0].sin =  0.0000 * ((2 ** 8) - 1);

        twiddles_storage[1].cos =  0.9239 * ((2 ** 8) - 1);
        twiddles_storage[1].sin = -0.3827 * ((2 ** 8) - 1);

        twiddles_storage[2].cos =  0.7071 * ((2 ** 8) - 1);
        twiddles_storage[2].sin = -0.7071 * ((2 ** 8) - 1);

        twiddles_storage[3].cos =  0.3827 * ((2 ** 8) - 1);
        twiddles_storage[3].sin = -0.9239 * ((2 ** 8) - 1);

        twiddles_storage[4].cos =  0.0000 * ((2 ** 8) - 1);
        twiddles_storage[4].sin = -1.0000 * ((2 ** 8) - 1);

        twiddles_storage[5].cos = -0.3827 * ((2 ** 8) - 1);
        twiddles_storage[5].sin = -0.9239 * ((2 ** 8) - 1);

        twiddles_storage[6].cos = -0.7071 * ((2 ** 8) - 1);
        twiddles_storage[6].sin = -0.7071 * ((2 ** 8) - 1);

        twiddles_storage[7].cos = -0.9239 * ((2 ** 8) - 1);
        twiddles_storage[7].sin = -0.3827 * ((2 ** 8) - 1);
        */
    end

    generate
        for (genvar i = 0; i < $clog2(FFT_SIZE)-1; i = i + 1) begin
            always_ff @(posedge clk) twiddles[i] <= twiddles_storage[indexes[i]];
        end
    endgenerate





endmodule
