module twid_idx_gen #(
    parameter int unsigned FFT_SIZE  = 32,
    parameter int unsigned NUM_STAGE = 4 ,
    parameter int unsigned LATENCY   = 0
) (
    input  logic                        clk    ,
    input  logic [$clog2(FFT_SIZE)-2:0] counter,
    output logic [$clog2(FFT_SIZE)-2:0] index
);


    localparam int unsigned W = $clog2(FFT_SIZE);

    logic [W-2:0] i_idx;


    generate
        if (NUM_STAGE == 1) begin
            assign i_idx = { counter[$bits(counter)-2:0], counter[$bits(counter)-1]};
        end else if(NUM_STAGE == $clog2(FFT_SIZE)-1) begin
            assign i_idx = { counter[$bits(counter)-1], {$clog2(FFT_SIZE)-2 {1'b0}}};
        end else begin
            assign i_idx = { counter[$bits(counter)-1-NUM_STAGE:0], counter[$bits(counter)-1], {NUM_STAGE-1 {1'b0}}  };
        end
    endgenerate

    generate
        if (LATENCY==0) begin
            assign index = i_idx;
        end else begin
            logic [LATENCY-1:0][W-2:0] r_idx;
            always_ff @(posedge clk) begin
                r_idx <= { r_idx[LATENCY-2:0], i_idx };
            end
            assign index = r_idx[LATENCY-1];
        end
    endgenerate

endmodule
