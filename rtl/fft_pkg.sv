package fft_pkg;
    //! Разрядность данных
    parameter int unsigned DATA_WIDTH    = 32;
    //! Разрядность поворотных коэффициентов
    parameter int unsigned TWIDDLE_WIDTH = 9;

    //! Представление комплексного числа
    typedef struct packed {
        logic [DATA_WIDTH-1:0] re;
        logic [DATA_WIDTH-1:0] im;
    } complex_t;

    //! Представление поворотного коэффициента
    typedef struct packed {
        logic [TWIDDLE_WIDTH-1:0] cos;
        logic [TWIDDLE_WIDTH-1:0] sin;
    } twiddle_t;

    //! Перевод двух TWIDDLE_WIDTH-разрядных векторов в поворотный коэффициент
    function twiddle_t to_twiddle(logic [TWIDDLE_WIDTH-1:0] cos, logic [TWIDDLE_WIDTH-1:0] sin);
        to_twiddle.cos = cos;
        to_twiddle.sin = sin;
    endfunction

    //! Перевод двух DATA_WIDTH-разрядных векторов в комплексное число    
    function complex_t to_complex(logic [DATA_WIDTH-1:0] re, logic [DATA_WIDTH-1:0] im);
        to_complex.re = re;
        to_complex.im = im;
    endfunction
    
endpackage
