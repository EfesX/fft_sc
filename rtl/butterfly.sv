import fft_pkg::data_t;

module butterfly (
    input  data_t ina ,
    input  data_t inb ,
    output data_t outa,
    output data_t outb
);

assign outa = $signed(ina) + $signed(inb);
assign outb = $signed(ina) - $signed(inb);

endmodule
