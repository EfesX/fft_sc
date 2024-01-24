package fft_pkg;

    parameter int unsigned DATA_WIDTH    = 16;
    parameter int unsigned TWIDDLE_WIDTH = 16;

    typedef logic [DATA_WIDTH-1:0] data_t;

    typedef struct packed {
        data_t re;
        data_t im;
    } complex_t;

    typedef struct packed {
        logic [TWIDDLE_WIDTH-1:0] cos;
        logic [TWIDDLE_WIDTH-1:0] sin;
    } twiddle_t;

    function twiddle_t to_twiddle(logic [TWIDDLE_WIDTH-1:0] cos, logic [TWIDDLE_WIDTH-1:0] sin);
        to_twiddle.cos = cos;
        to_twiddle.sin = sin;
    endfunction

    function complex_t to_complex(logic [TWIDDLE_WIDTH-1:0] re, logic [TWIDDLE_WIDTH-1:0] im);
        to_complex = to_twiddle(re, im);
    endfunction
    
endpackage
