function [h,w] = check_freq_response(in,N)
%N is the number of frequency samples
%in is the input signal
%addpath('../matlab/freq/');
%normalise amplitude
mx = max(abs(in));
in = in / mx;
[h,w] = freq_response(in,N,1);

end

function [h,w] = freq_response(h,N,varargin);
%this will get the frequency response given an input signal
[h,w] = dtft(h,N);
if nargin > 2
    subplot(211);
    m = 20*log10(abs(h)); 
    plot(w/pi,m);
    ylabel('Magnitude in db');
    xlabel('Normalised Frequency');
    subplot(212);
    plot(w/pi,angle(h));
    ylabel('Phase response');
    xlabel('Normalised Frequency');
    whitebg(gcf,'k');
end
end

function [H, W] = dtft(h, N)
%DTFT   calculate DTFT at N equally spaced frequencies
%----
%   Usage:   [H, W] = dtft(h, N)
%
%      h : finite-length input vector, whose length is L
%      N : number of frequencies for evaluation over [-pi,pi)
%              ==> constraint: N >= L 
%      H : DTFT values (complex)
%      W : (2nd output) vector of freqs where DTFT is computed

%---------------------------------------------------------------
% copyright 1994, by C.S. Burrus, J.H. McClellan, A.V. Oppenheim,
% T.W. Parks, R.W. Schafer, & H.W. Schussler.  For use with the book
% "Computer-Based Exercises for Signal Processing Using MATLAB"
% (Prentice-Hall, 1994).
%---------------------------------------------------------------

N = fix(N);
L = length(h);  h = h(:);  %<-- for vectors ONLY !!!
if( N < L )
   error('DTFT: # data samples cannot exceed # freq samples')
end
W = (2*pi/N) * [ 0:(N-1) ]';
mid = ceil(N/2) + 1;
W(mid:N) = W(mid:N) - 2*pi;   % <--- move [pi,2pi) to [-pi,0)
W = fftshift(W);
H = fftshift( fft( h, N ) );  %<--- move negative freq components
end
