import argparse
import math

if __name__ == "__main__":
    selfname = __file__

    parser = argparse.ArgumentParser(description='Создание хранилища поворотных коэффициентов')

    parser.add_argument('--size', help='Число отсчетов FFT')
    parser.add_argument('--filepath', help='Путь к файлу, в который будут записаны поворотные коэффициенты')

    args = parser.parse_args()

    n_fft = int(args.size)
    half_n_fft = int(int(args.size) / 2)
    n_pow = 8
    filepath = args.filepath + "/twiddles_gen.sv" 

    with open(filepath, 'w') as f:
        f.write("/***\n")
        f.write(f"  This file was generated with {selfname}.\n")
        f.write(f"  This file stores twiddles coefficients for {n_fft}-point FFT.\n")
        f.write(f"  Amount of ports of access to storage equals amount of stages of {n_fft}-point FFT.\n")
        f.write(f"  Twiddles storage consists only first {int(n_fft / 2)} coefficients.\n")
        f.write("***/\n\n")
        f.write("import fft_pkg::twiddle_t;\n")
        f.write("import fft_pkg::TWIDDLE_WIDTH;\n")
        f.write("\n")
        f.write(f"\
module twiddles_gen #(parameter int unsigned FFT_SIZE = {n_fft}) ( \n\
    input  logic                                                  clk     , \n\
    input  logic     [$clog2(FFT_SIZE)-2:0][$clog2(FFT_SIZE)-2:0] indexes , \n\
    output twiddle_t [$clog2(FFT_SIZE)-2:0]                       twiddles  \n\
);\n"
        )
        f.write("\n")
        f.write("    localparam int unsigned TOTAL_TWIDDLES = FFT_SIZE/2;\n")
        f.write("    twiddle_t [TOTAL_TWIDDLES-1:0] twiddles_storage;\n")
        f.write("\n")
        f.write("    initial begin\n")
        for i in range(half_n_fft):
            f.write(f"        twiddles_storage[{ i }].cos = { (math.cos( 2 * 3.1416 * i / n_fft)) } * ((2 ** {n_pow}) - 1);\n")
            f.write(f"        twiddles_storage[{ i }].sin = { (math.sin(-2 * 3.1416 * i / n_fft)) } * ((2 ** {n_pow}) - 1);\n")
            f.write("\n")
        f.write("    end\n")
        f.write("\
    generate\n \
        genvar j;\n \
            for (j = 0; j < $clog2(FFT_SIZE)-1; j = j + 1) begin : GEN_TWIDDLES_REGS\n \
            always_ff @(posedge clk) twiddles[j] <= twiddles_storage[indexes[j]];\n \
        end\n\
    endgenerate\n"
        )
        f.write("\n")
        f.write("endmodule\n")