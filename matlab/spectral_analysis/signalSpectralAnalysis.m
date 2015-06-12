% Andrew Schneer
% FFT Matlab Code
% 06/11/2015

close all;
clear all;
clc;

% Create a sample waveform to test code with.
a = 1;
% Signal frequency.
F = 10; % Hz.
% Signal period.
T = (1/F); % sec.
% Sampling frequency.
Fs = 1000; % Hz.
% Sampling period.
Ts = (1/Fs); % sec.
k = 0;
t_start = 0; % sec.
t_finish = 2; % sec.
dt = (t_finish-t_start); % sec.
t = linspace(t_start,t_finish,(Fs*dt));
% Signal.
x = ((a*sin(2.*pi.*F.*t))+k);
% Number of FFT points.
% Extra ones are zero padded
% onto signal.
nfft = (2^(ceil(log10(length(x))/log10(2))));
% Take FFT.  The result is
% a series of complex numbers.
X = fft(x,nfft);
% Take first half of FFT output.
X = X(1:(nfft/2));
% Magnitude of FFT output.
% This converts the complex
% numbers into real number
% magnitude values.
MX = abs(X);
% Power of FFT output.
% Taking the magnitude of the complex
% FFT output and squaring it is the
% same as multiplying each complex element
% by its conjugate.  The only difference
% is that technically the conjugate method
% produces a complex number with zero
% imaginary component while the magnitude/
% squaring method produces simply a real number.
PX = 10*log10((MX));
% Frequency spectrum values.
f = ((Fs/nfft).*linspace(0,((nfft/2)-1),(nfft/2)));

% Plots.
figure(1);
% Signal.
subplot(3,1,1);
plot(t,x);
xlabel('Time (s)');
ylabel('Value');
% FFT Amplitude.
subplot(3,1,2);
plot(f,X);
xlabel('Frequency (Hz)');
ylabel('FFT Amplitude');
% PSD Power Spectral Density.
subplot(3,1,3);
plot();
xlabel('Frequency (Hz)');
ylabel('Spectral Power ()');