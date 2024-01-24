module control #(parameter int unsigned FFT_SIZE  = 16) (
    input  logic                                              clk      ,
    input  logic                                              din_valid,
    output logic [$clog2(FFT_SIZE)-1:0]                       swro     ,
    output logic                                              swpe     ,
    output logic [$clog2(FFT_SIZE)-2:0][$clog2(FFT_SIZE)-2:0] twid_idx
);

    localparam int unsigned TOTAL_STAGES = $clog2(FFT_SIZE);

    logic                    cnt_ena = 1'b0                   ;
    logic [TOTAL_STAGES-1:0] counter = { TOTAL_STAGES {1'b1} };

    logic [FFT_SIZE-1:0][TOTAL_STAGES-1:0] counter_delayed;

    always_ff @(posedge clk) begin
        if (din_valid) cnt_ena <= 1'b1;

        if (cnt_ena) counter <= counter + 1'b1;
        else counter <= {TOTAL_STAGES {1'b1}};

    end




    assign swpe = counter[0];

    generate
        for (genvar i = 0; i < TOTAL_STAGES; i = i + 1) begin
            assign swro[i] = ~counter[TOTAL_STAGES-1-i] | counter[0];
        end
    endgenerate

    generate
        for (genvar i = 1; i < TOTAL_STAGES; i = i + 1) begin
            twid_idx_gen #(
                .FFT_SIZE (FFT_SIZE ),
                .NUM_STAGE(i),
                .LATENCY  (0        )
            ) twid_idx_gen (
                .clk    (clk                           ),
                .counter(counter[$bits(counter)-1:1]   ),
                .index  (twid_idx[i-1]                 )
            );
        end
    endgenerate







endmodule
