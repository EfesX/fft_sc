clc; clear all; close all;

Fs = 1000;
T = 1/Fs;
L = 1024;
t = (0:L-1)*T;
A = 8192;
Ss = floor(A * sin(2*pi*200*t)) + floor(A * sin(2*pi*300*t));
Sc = floor(A * cos(2*pi*200*t)) + floor(A * cos(2*pi*300*t));


fid = fopen(".\in.txt", "w");

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



