% This script is model of 16-point FFT which imlemented in FPGA (SC method)

%% clear workspace
clc; clear all; close all;

%% 
M_FACT = 255;

%% read data
fid = fopen(".\in.txt", "r");
rawdata = fscanf(fid, "%d");
rawdata = rawdata(1:end);
fclose(fid);

datare = rawdata(1:2:end);
dataim = rawdata(2:2:end);
data = complex(datare, dataim);

in = data;

%% input reorder
inr = zeros(16, 1);
inr(1) = in(1);
inr(2) = in(9);
inr(3) = in(3);
inr(4) = in(11);
inr(5) = in(5);
inr(6) = in(13);
inr(7) = in(7);
inr(8) = in(15);
inr(9) = in(2);
inr(10) = in(10);
inr(11) = in(4);
inr(12) = in(12);
inr(13) = in(6);
inr(14) = in(14);
inr(15) = in(8);
inr(16) = in(16);

%% stage 1
st1 = zeros(16, 1);
idx = 0;
for k = 1:2:16
    switch k
        case 1
            idx = 0;
        case 3
            idx = 2;
        case 5
            idx = 4;
        case 7
            idx = 6;
        case 9
            idx = 1;
        case 11
            idx = 3;
        case 13
            idx = 5;
        case 15
            idx = 7;
    end
    
    disp(exp(-i * 2 * pi * idx / 16) * M_FACT)
    
    [st1(k),  st1(1 + k)] = radix2(inr(k), inr(1 + k),  exp(-i * 2 * pi * idx / 16)*M_FACT);
    idx = idx + 2;
end

st1(2:2:end) = floor(st1(2:2:end) / M_FACT);

%st1 = inr;

st1r = st1;
st1r(1) = st1(1);
st1r(2) = st1(5);
st1r(3) = st1(3);
st1r(4) = st1(7);
st1r(5) = st1(2);
st1r(6) = st1(6);
st1r(7) = st1(4);
st1r(8) = st1(8);
st1r(9) = st1(9);
st1r(10) = st1(13);
st1r(11) = st1(11);
st1r(12) = st1(15);
st1r(13) = st1(10);
st1r(14) = st1(14);
st1r(15) = st1(12);
st1r(16) = st1(16);

%% stage 2
st2 = zeros(16, 1);
idx = 0;
for k = 1:2:8
    switch k
        case 1
            idx = 0;
        case 3
            idx = 4;
        case 5
            idx = 0;
        case 7
            idx = 4;
    end
    [st2(    k),  st2(1 + k)] = radix2(st1r(    k), st1r( 1 + k),  exp(-i * 2 * pi * idx / 16)*M_FACT);
end
idx = 0;
for k = 1:2:8
    switch k
        case 1
            idx = 2;
        case 3
            idx = 6;
        case 5
            idx = 2;
        case 7
            idx = 6;
    end
    [st2(8 + k),  st2(9 + k)] = radix2(st1r(8 + k), st1r(9 + k),   exp(-i * 2 * pi * idx / 16)*M_FACT);
end

st2(2:2:end) = floor(st2(2:2:end) / M_FACT);
%st2 = st1r;

st2r = st2;
st2r(2) = st2(3);
st2r(3) = st2(2);
st2r(6) = st2(7);
st2r(7) = st2(6);
st2r(10) = st2(11);
st2r(11) = st2(10);
st2r(14) = st2(15);
st2r(15) = st2(14);

%% stage 3
st3 = zeros(16, 1);
for k = 1:2:8
    [st3(k),  st3(k + 1)] = radix2(st2r(k), st2r(k + 1),  exp(-i * 2 * pi * 0 / 16)*M_FACT);
end
for k = 9:2:16
    [st3(k),  st3(k + 1)] = radix2(st2r(k), st2r(k + 1),  exp(-i * 2 * pi * 4 / 16)*M_FACT);
end

st3(2:2:end) = floor(st3(2:2:end) / M_FACT);
%st3 = st2r;

st3r = st3;
st3r(2) = st3(9);
st3r(4) = st3(11);
st3r(6) = st3(13);
st3r(8) = st3(15);
st3r(9) = st3(2);
st3r(11) = st3(4);
st3r(13) = st3(6);
st3r(15) = st3(8);

%% stage 4
st4 = zeros(16, 1);
for k = 1:2:16
    [st4(k),  st4(k + 1)] = radix2(st3r(k), st3r(k + 1),  exp(-i * 2 * pi * 0 / 16)*M_FACT);
end

st4(2:2:end) = floor(st4(2:2:end) / M_FACT);

st4r = st4;

st4r(2) = st4(5);
st4r(4) = st4(7);
st4r(5) = st4(9);
st4r(6) = st4(13);
st4r(7) = st4(11);
st4r(8) = st4(15);
st4r(9) = st4(2);
st4r(10) = st4(6);
st4r(11) = st4(4);
st4r(12) = st4(8);
st4r(13) = st4(10);
st4r(15) = st4(12);

[fft(in) st4r]
