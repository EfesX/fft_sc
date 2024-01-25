clc; clear all; close all;

Fs = 1000;
T = 1/Fs;
L = 256;
t = (0:L-1)*T;
Ss = floor(100 * sin(2*pi*200*t)) + floor(100 * sin(2*pi*300*t));
Sc = floor(100 * cos(2*pi*200*t)) + floor(100 * cos(2*pi*300*t));


fid = fopen("E:\sandbox\fpga\fft\sim\in.txt", "w");

for i = 1:L
    fprintf(fid, "%d\n", Sc(i));
    fprintf(fid, "%d\n", Ss(i));
end

fclose(fid);

f = Fs*(0:L-1)/L;
Y = abs(fft(complex(Sc, Ss)));

figure
plot(f, Y)

figure
plot(t, Sc)
hold on;
plot(t, Ss)



