import fft_pkg::DATA_WIDTH;

module tb_fft_sc ();

    bit        clk       ;
    bit [DATA_WIDTH-1:0] din_re    ;
    bit [DATA_WIDTH-1:0] din_im    ;
    bit        din_valid ;
    bit [DATA_WIDTH-1:0] dout_re   ;
    bit [DATA_WIDTH-1:0] dout_im   ;
    bit        dout_valid;

    always #5 clk = ~clk;

    int fid;
    string line;
    int val;

    int fidw;

    initial begin
        #251;

        fid = $fopen("../in.txt", "r");
        
        while (!$feof(fid)) begin
            @(posedge clk);
            din_valid = 1;

            $fscanf(fid, "%0d", val);
            din_re = val;

            $fscanf(fid, "%0d", val);
            din_im = val;
        end

        @(posedge clk);
        din_valid = 0;

        $fclose(fid);

        #40000;

        fid = $fopen("../in.txt", "r");
        
        while (!$feof(fid)) begin
            @(posedge clk);
            din_valid = 1;

            $fscanf(fid, "%0d", val);
            din_re = val;

            $fscanf(fid, "%0d", val);
            din_im = val;
        end

        @(posedge clk);
        din_valid = 0;

        $fclose(fid);
    end

    initial begin
        @(posedge dout_valid);
        
        fidw = $fopen("../out.txt", "w");
        while (dout_valid) begin
            @(posedge clk);
            $fdisplay(fidw, "%d", $signed(dout_re));
            $fdisplay(fidw, "%d", $signed(dout_im));
        end

        $fclose(fidw);
    end

    fft_sc #(.FFT_SIZE(1024)) dut (
        .clk       (clk       ),
        .din_re    (din_re    ),
        .din_im    (din_im    ),
        .din_valid (din_valid ),
        .dout_re   (dout_re   ),
        .dout_im   (dout_im   ),
        .dout_valid(dout_valid)
    );

endmodule
