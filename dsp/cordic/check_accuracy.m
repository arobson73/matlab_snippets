function [sc,cc] = check_accuracy(arg,N)
%check accuracy with cordic sine / cosine and 
%using matlab in built sin and cos functions for a given N
s = sin(arg);
c = cos(arg);
for n = 1:N
    [sc(n),cc(n)] = sine_cosine(n,arg);
    sr(n) = snr(s,s-sc(n));
    cr(n) = snr(c,c-cc(n));
end
close all;
subplot(211);
plot(1:N, sc -s,'.g',1:N,cc-c,'.r');
title('differnece between cordic and library versions of sine for different N range');
ylabel('difference');
xlabel('number of iterations');
legend('sine','cosine');
subplot(212);
plot(1:N, sr,'.g',1:N,cr,'.r');
title('snr between cordic and library versions of sine for different N range');
ylabel('SNR');
xlabel('number of iterations');
legend('sine ','cosine');
whitebg(gcf,'k');


