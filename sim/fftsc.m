% This script reads modelsim's simulation result
% to verification with in.txt file (file created be setdata.m script)

%% clear workspace
clc; clear all; close all;

%% read reference signal and make fft
fid = fopen(".\in.txt", "r");

rawdata = fscanf(fid, "%d");
rawdata = rawdata(1:end);

fclose(fid);

datare = rawdata(1:2:end);
dataim = rawdata(2:2:end);

figure;
title('Input Signal (Time Domain)')
hold on;
plot(datare, '-black')
plot(dataim)

figure;
in = complex(datare, dataim);
Y = abs(fft(in));
plot(mag2db(Y))
title('Input Signal (FFT) [dB]')

%% read simulation result ()
fid = fopen(".\out.txt", "r");

rawdata = fscanf(fid, "%d");

fclose(fid);

datare = rawdata(1:2:end);
dataim = rawdata(2:2:end);

figure;
hold on;
out = complex(dataim, datare);
plot(mag2db(abs(out)))
title('Simulation Result [dB]')

%% calculate differnces simulation result with reference signal
figure
plot(mag2db(Y) - mag2db(abs(out)))
title('Simulation Error (in - out) [dB]')

