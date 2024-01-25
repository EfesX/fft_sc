clc; clear all; close all;

Fs = 1000;
T = 1/Fs;
L = 256;
f = Fs*(0:L-1)/L;

fid = fopen("E:\sandbox\fpga\fft\sim\in.txt", "r");

rawdata = fscanf(fid, "%d");
rawdata = rawdata(1:end);

fclose(fid);

datare = rawdata(1:2:end);
dataim = rawdata(2:2:end);

figure;
hold on;
plot(datare, '-black')
plot(dataim)

figure;
hold on;

in = complex(datare, dataim);
Y = abs(fft(in));
plot(f, Y)


%%
fid = fopen("E:\sandbox\fpga\fft\sim\out.txt", "r");

rawdata = fscanf(fid, "%d");
rawdata = rawdata(1:end-2);

fclose(fid);

datare = rawdata(1:2:end);
dataim = rawdata(2:2:end);

datare = datare(1:end-1);
dataim = dataim(1:end-1);

figure;
hold on;

out = complex(dataim, datare);
plot(f, abs(out))
