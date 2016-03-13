function test_filter(k,N,vr)

omega = 2*pi *k/N;

%create a sinewave with some noise added
n= 0:6000;
sine = sin(omega*n);
noi = sqrt(vr) .*randn(1,length(n));
snt = sine+noi;
sn = snt(1:255);
%plot the sine and sine+noise
figure(1);
plot(n(1:255),sine(1:255),'g',n(1:255),sn,'r');whitebg(gcf,'k');
title('plot of original sine and noisy sine');
%check the frquency response
addpath('../freq/');
addpath('../freq_resp/');
figure(2);
[h,w] = check_freq_response(sn,1024);
title('frequency response of noisy sine signal');

%create the FSF filter
[b,a] = freq_selective_filter(N,k);
figure(3);
subplot(311);
[hf,wf] = freqz(b,a);
plot(wf/pi,abs(hf),'.g');
title('frequency response of FSF filter');
subplot(312);
plot(wf/pi,angle(hf), '.g');
title('phase response of FSF filter');
subplot(313);
zplane(b,a);

title('zplane of FSF filter');
whitebg(gcf,'k');

%filter the noisy signal

yt = filter(b,a,snt);
%check the filtered signal frequency response
y = yt(1:255);
figure(4);
[h1,w1] = check_freq_response(y,1024);
title('frequency response of filtered signal');

%plot the filtered signal
figure(5);
plot(n(1:255),y,'g',n(1:255),sn,'r');whitebg(gcf,'k');
title('plot of filtered signal');
