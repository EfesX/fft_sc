import fft_pkg::DATA_WIDTH;

//! Реализация операции "бабочка"
module butterfly (
    input  logic [DATA_WIDTH-1:0] ina ,
    input  logic [DATA_WIDTH-1:0] inb ,
    output logic [DATA_WIDTH-1:0] outa,
    output logic [DATA_WIDTH-1:0] outb
);

assign outa = $signed(ina) + $signed(inb);
assign outb = $signed(ina) - $signed(inb);

endmodule
