% This script creates in.txt file
% in.txt contains data for modelsim simulation

%% clear workspace
clc; clear all; close all;

%% set parameters
Fs = 1000;
T = 1/Fs;
L = 1024; 
A = 8192;

%% create signal
t = (0:L-1)*T;

Ss = floor(A * sin(2*pi*200*t)) + floor(A * sin(2*pi*300*t));
Sc = floor(A * cos(2*pi*200*t)) + floor(A * cos(2*pi*300*t));

%% write signal to file
fid = fopen(".\in.txt", "w");

for i = 1:L
    fprintf(fid, "%d\n", Sc(i));
    fprintf(fid, "%d", Ss(i));
    if i ~= L
        fprintf(fid, "\n");
    end
end

fclose(fid);

%% show graphics
f = Fs*(0:L-1)/L;
Y = abs(fft(complex(Sc, Ss)));

figure
plot(f, Y)

figure
plot(t, Sc)
hold on;
plot(t, Ss)
