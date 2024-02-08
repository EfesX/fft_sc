import fft_pkg::complex_t;
import fft_pkg::twiddle_t;

import fft_pkg::DATA_WIDTH;

module proc_elem #(
    parameter bit INCLUDE_BUTTERFLY = 1,
    parameter bit INCLUDE_ROTATOR   = 1
) (
    input  logic     clk    ,
    input  logic     sw     ,
    input  complex_t din    ,
    input  twiddle_t twiddle,
    output complex_t dout
);

    logic [DATA_WIDTH-1:0]                 r_din_re;
    logic [           1:0][DATA_WIDTH-1:0] r_din_im;

    always_ff @(posedge clk) begin
        r_din_re <= din.re;
        r_din_im <= { r_din_im[0], din.im };
    end

    logic [DATA_WIDTH-1:0] mux_0;
    logic [DATA_WIDTH-1:0] mux_1;

    assign mux_0 = sw ? r_din_im[1] : r_din_re;
    assign mux_1 = sw ? r_din_im[0] : din.re;

    generate
        logic [DATA_WIDTH-1:0] d_butter_a;
        logic [DATA_WIDTH-1:0] d_butter_b;

        if (INCLUDE_BUTTERFLY) begin
            butterfly butterfly (
                .ina  (mux_0      ),
                .inb  (mux_1      ),
                .outa (d_butter_a ),
                .outb (d_butter_b )
            );
        end else begin
            assign d_butter_a = mux_0;
            assign d_butter_b = mux_1;
        end
    endgenerate

    generate
        logic [DATA_WIDTH-1:0] d_rotator;
        logic [DATA_WIDTH-1:0] dout_b;

        if (INCLUDE_BUTTERFLY) assign dout_b = d_butter_b;
        else assign dout_b = mux_1;

        if (INCLUDE_ROTATOR) begin
            rotator rotator (
                .clk     (clk       ),
                .sw      (sw        ),
                .din     (dout_b    ),
                .twiddle (twiddle   ),
                .dout    (d_rotator )
            );
        end else begin
            always_ff @(posedge clk) begin
                d_rotator <= dout_b;
            end
        end
    endgenerate

    logic [DATA_WIDTH-1:0] mux_2;
    logic [DATA_WIDTH-1:0] mux_3;

    assign mux_2 = sw ? d_rotator  : d_butter_a;
    assign mux_3 = sw ? d_butter_a : d_rotator;

    logic [DATA_WIDTH-1:0] r_out_re;
    always_ff @(posedge clk) r_out_re <= mux_2;

    assign dout.re = r_out_re;
    assign dout.im = mux_3;

endmodule
