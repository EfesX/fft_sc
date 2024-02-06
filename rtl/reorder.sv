import fft_pkg::complex_t;

module reorder #(parameter int unsigned LENGTH = 7) (
    input  logic     clk       ,
    input  logic     sw        ,
    input  complex_t din       ,
    input  logic     din_valid ,
    output complex_t dout      ,
    output logic     dout_valid
);

    complex_t [LENGTH-1:0] shiftreg;
    complex_t              muxin   ;
    complex_t              muxout  ;

    logic [LENGTH-1:0] valid_pipe;

    generate
        genvar i;
        for (i = 0; i < LENGTH; i = i + 1) begin : GEN_SHIFT_REG
            always_ff @(posedge clk) begin
                if (i == 0) begin
                    shiftreg[i]   <= muxin;
                    valid_pipe[i] <= din_valid;
                end else begin
                    shiftreg[i]   <= shiftreg[i - 1];
                    valid_pipe[i] <= valid_pipe[i - 1];
                end
            end
        end
    endgenerate

    assign muxin = sw ? din : shiftreg[LENGTH-1];
    assign muxout = sw ? shiftreg[LENGTH-1] : din;

    assign dout       = muxout;
    assign dout_valid = valid_pipe[LENGTH - 1];

endmodule
