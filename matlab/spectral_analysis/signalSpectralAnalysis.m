% Andrew Schneer
% FFT Matlab Code
% 06/11/2015

% Housekeeping.
close all;
clear all;
clc;

% Create dummy sinewave for
% testing the code.

	% Create a sample waveform to test code with.
	dum_a = 1;
	% Phase offset of signal.
	dum_b = 0; % radians.
	% Signal frequency.
	dum_F = 10; % Hz.
	% Signal period.
	dum_T = (1/dum_F); % sec.
	% Sampling frequency.
	dum_Fs = 1000; % Hz.
	% Sampling period.
	dum_Ts = (1/dum_Fs); % sec.
	% Signal DC offset.
	dum_k = 0;
	% Signal interval times.
	dum_t_start = 0; % sec.
	dum_t_finish = 2; % sec.
	dum_dt = (dum_t_finish-dum_t_start); % sec.
	% Time scale.
	dum_t = linspace(dum_t_start,dum_t_finish,(dum_Fs*dum_dt)); % sec.
	% Signal.
	dum_x = ((dum_a*sin((2.*pi.*dum_F.*dum_t)+dum_b))+dum_k);

% Obtain actual signal to perform
% spectral analysis on.

	% IMPORT SIGNAL DATA...
	x = dum_x; % (temporary).

% Declare information about
% imported signal.

% Sampling frequency.
%Fs = 1000; % Hz.
Fs = dum_Fs; % Hz.
% Sampling period.
%Ts = (1/Fs); % sec.
Ts = dum_Ts; % sec.
% Time scale.
%t = linspace(dum_t_start,dum_t_finish,(dum_Fs*dum_dt)); % sec.
t = dum_t; % sec.
% Number of FFT points.
% Extra ones are zero padded
% onto signal.
nfft = (2^(ceil(log10(length(x))/log10(2))));
% Frequency spectrum values.
f = ((Fs/nfft).*linspace(0,((nfft/2)-1),(nfft/2)));

% Perform actual spectral analysis
% on imported signal.

% Take FFT.  The result is
% a series of complex numbers.
dft = fft(x,nfft);
% Take first half of FFT output.
dft = dft(1:(nfft/2));
% Magnitude of FFT output.
% This converts the complex
% numbers into real number
% magnitude values.
mag_dft = abs(dft);
% Power of FFT output.
% Taking the magnitude of the complex
% FFT output and squaring it is the
% same as multiplying each complex element
% by its conjugate.  The only difference
% is that technically the conjugate method
% produces a complex number with zero
% imaginary component while the magnitude/
% squaring method produces simply a real number.
pow_dft = (mag_dft.^2);
% Plot power on log scale.
pow_dft_log = (10.*log10(pow_dft));

% Plots.
figure(1);
% Signal.
subplot(3,1,1);
plot(t,x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Value');
% FFT Amplitude.
subplot(3,1,2);
plot(f,mag_dft);
title('FFT Amplitude Plot');
xlabel('Frequency (Hz)');
ylabel('FFT Amplitude');
% PSD Power Spectral Density.
subplot(3,1,3);
plot(f,pow_dft_log);
title('FFT PSD Plot');
xlabel('Frequency (Hz)');
ylabel('Spectral Power (dB)');