import fft_pkg::complex_t;

module out_reorder #(parameter int unsigned FFT_SIZE = 16) (
    input  logic     clk       ,
    input  complex_t din       ,
    input  logic     din_valid ,
    output complex_t dout      ,
    output logic     dout_valid
);

    localparam int unsigned TOTAL_STAGES   = $clog2(FFT_SIZE)      ;
    localparam int unsigned TOTAL_REORDERS = (TOTAL_STAGES + 1) / 2;

    complex_t [TOTAL_REORDERS-1:0] data;

    assign dout = data[TOTAL_REORDERS-1];

    logic [TOTAL_REORDERS-1:0] valids;
    assign dout_valid = valids[TOTAL_REORDERS-1];

    genvar i;
    generate
        for (i = 0; i < TOTAL_REORDERS; i = i + 1) begin : GEN_REORDERS
            if (i == 0) begin // FIRST REORDER

                logic [TOTAL_STAGES-1:0] counter;
                always_ff @(posedge clk) begin
                    if (din_valid) counter <= counter + 1'b1;
                    else counter <= {TOTAL_STAGES {1'b1}};
                end

                logic sw;
                assign sw = ~counter[TOTAL_STAGES-2] | counter[0];

                complex_t r_d;
                always_ff @(posedge clk) r_d <= din;

                logic rv;
                always_ff @(posedge clk) rv <= din_valid;

                reorder #(.LENGTH(FFT_SIZE/4-1)) reorder (
                    .clk (clk    ),
                    .sw  (sw     ),
                    .din (r_d),
                    .din_valid(rv),
                    .dout(data[0]),
                    .dout_valid(valids[0])
                );

            end else if (i == 1) begin // GEN_SECOND_REORDER

                logic [TOTAL_STAGES-1:0] counter;
                always_ff @(posedge clk) begin
                    if (valids[0]) counter <= counter + 1'b1;
                    else counter <= {TOTAL_STAGES {1'b1}};
                end

                logic sw;
                assign sw = ~counter[TOTAL_STAGES-1] | counter[TOTAL_STAGES-2];

                complex_t r_d;
                always_ff @(posedge clk) r_d <= data[0];

                logic r_v;
                always_ff @(posedge clk) r_v <= valids[0];

                reorder #(
                    .LENGTH(FFT_SIZE/4)
                ) reorder (
                    .clk (clk),
                    .sw  (sw),
                    .din (r_d),
                    .dout(data[1]),
                    .din_valid(r_v),
                    .dout_valid(valids[1])
                );
            end else begin // GEN_ANOTHER_REORDERS
                logic [TOTAL_STAGES-1:0] counter;
                always_ff @(posedge clk) begin
                    if (valids[i-1]) counter <= counter + 1'b1;
                    else counter <= {TOTAL_STAGES {1'b1}};
                end

                logic sw;
                assign sw = ~counter[TOTAL_STAGES - (i - 1) - 2] | counter[i - 1];

                complex_t r_d;
                always_ff @(posedge clk) r_d <= data[i-1];

                logic r_v;
                always_ff @(posedge clk) r_v <= valids[i-1];

                reorder #(
                    .LENGTH(2 ** (TOTAL_STAGES - (i - 1) - 2) - 2 ** (i - 1))
                ) reorder (
                    .clk (clk),
                    .sw  (sw),
                    .din (r_d),
                    .dout(data[i]),
                    .din_valid(r_v),
                    .dout_valid(valids[i])
                );
            end
        end
    endgenerate
endmodule
