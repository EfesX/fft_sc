import fft_pkg::complex_t;

module reorder #(parameter int unsigned LENGTH = 7) (
    input  logic     clk ,
    input  logic     sw  ,
    input  complex_t din ,
    input  logic     din_valid,
    output complex_t dout,
    output logic     dout_valid
);

    complex_t [LENGTH-1:0] shiftreg;
    complex_t              muxin   ;
    complex_t              muxout  ;

    always_ff @(posedge clk) shiftreg <= { shiftreg[LENGTH-2:0], muxin };

    assign muxin  = sw ? din : shiftreg[LENGTH-1];
    assign muxout = sw ? shiftreg[LENGTH-1] : din;

    assign dout = muxout;

    logic [LENGTH-1:0] valid_pipe;
    always_ff @(posedge clk) begin
        valid_pipe <= { valid_pipe[LENGTH-2:0], din_valid };
    end
    
    assign dout_valid = valid_pipe[LENGTH - 1];

endmodule
