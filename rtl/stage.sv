import fft_pkg::complex_t;
import fft_pkg::twiddle_t;

module stage #(
    parameter int unsigned FFT_SIZE     = 16  ,
    parameter int unsigned NUM_STAGE    = 1   ,
    parameter bit          INCLUDE_PROC = 1'b0
) (
    input  logic                        clk          ,
    input  complex_t                    din          ,
    input  logic                        din_valid    ,
    output complex_t                    dout         ,
    output logic                        dout_valid   ,
    output logic [$clog2(FFT_SIZE)-2:0] twiddle_index,
    input  twiddle_t                    twiddle
);

    localparam int unsigned TOTAL_STAGES = $clog2(FFT_SIZE);

    localparam bit          INCLUDE_REORDER = (NUM_STAGE == TOTAL_STAGES) ? 1'b0 : 1'b1                                                                                   ;
    localparam int unsigned LEN_REORDER     = (NUM_STAGE == TOTAL_STAGES - 1) ? FFT_SIZE/2 - 1 : (NUM_STAGE == TOTAL_STAGES) ? 0 : 2 ** (TOTAL_STAGES - NUM_STAGE - 1) - 1;

    localparam bit INCLUDE_ROTATOR = (NUM_STAGE == TOTAL_STAGES) ? 1'b0 : 1'b1;

    logic [TOTAL_STAGES-1:0] counter = { TOTAL_STAGES {1'b1} };

    logic swpe;

    complex_t data_pe;

    assign swpe = counter[0];

    logic [LEN_REORDER+1:0] din_valid_delayed;

    assign dout_valid = din_valid_delayed[$bits(din_valid_delayed)-1];

    always_ff @(posedge clk) begin
        if (din_valid || din_valid_delayed[0]) counter <= counter + 1'b1;
        else counter <= {TOTAL_STAGES {1'b1}};

        din_valid_delayed <= { din_valid_delayed[$bits(din_valid_delayed)-2:0], din_valid };
    end

    generate
        if (INCLUDE_PROC) begin
            proc_elem #(
                .INCLUDE_BUTTERFLY(1              ),
                .INCLUDE_ROTATOR  (INCLUDE_ROTATOR)
            ) proc_elem (
                .clk    (clk    ),
                .sw     (swpe   ),
                .din    (din    ),
                .twiddle(twiddle),
                .dout   (data_pe)
            );
        end else begin
            complex_t d_bypass_delay;
            always_ff @(posedge clk) begin
                d_bypass_delay <= din;
                data_pe <= d_bypass_delay;
            end
        end
    endgenerate
    generate
        if (INCLUDE_REORDER) begin
            logic     swro   ;
            complex_t data_ro;

            always_ff @(posedge clk) begin
                if ((TOTAL_STAGES - NUM_STAGE - 1) == 0) begin
                    swro <= ~counter[$bits(counter) - 1] | counter[0];
                end else begin
                    swro <= ~counter[TOTAL_STAGES - NUM_STAGE - 1] | counter[0];
                end
            end

            reorder #(.LENGTH(LEN_REORDER)) reorder (
                .clk (clk     ),
                .sw  (swro    ),
                .din (data_pe ),
                .dout(data_ro ),
                .din_valid  (),
                .dout_valid ()
            );

            assign dout = data_ro;
        end else begin
            assign dout = data_pe;
        end
    endgenerate
    generate
        if (TOTAL_STAGES != NUM_STAGE) begin
            twiddle_t [1:0] twiddle_delayed;
            always_ff @(posedge clk) twiddle_delayed <= { twiddle_delayed[0], twiddle };

            twid_idx_gen #(
                .FFT_SIZE (FFT_SIZE ),
                .NUM_STAGE(NUM_STAGE),
                .LATENCY  (0        )
            ) twid_idx_gen (
                .clk    (clk                      ),
                .counter(counter[TOTAL_STAGES-1:1]),
                .index  (twiddle_index            )
            );
        end else begin
            always_ff @(posedge clk) twiddle_index <= { $clog2(FFT_SIZE)-1 {1'b0} };
        end
    endgenerate

endmodule
