function [sn,n,sig_noise_ratio,mag] = sine_noise(A,N,f,fs,nm,nv,p)
%nm - noise mean
%nv noise variance
%p = plot yes / no
addpath('../snr');
omega = 2*pi*f/fs;
n = [0:N-1];                   % Time index
s = A*sin(omega*n);              % Sine sequence
n = sqrt(12)*(rand(1,N) - 0.5); %noise zero mean unit variance
n = (sqrt(nv)*n) + nm; % noise at required variance and mean
sn = s + n;
sig_noise_ratio = snr(sn,s);
Xk=fft(sn,N);
mag = 20*log10(abs(Xk));
if p == 1
    close;
    plot([0:N-1], mag); axis([0, N/2, -inf, inf]); % plot from 0 to pi
    xlabel('Frequency index, k');
    ylabel('Magnitude (dB)');
end
