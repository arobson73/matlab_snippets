function [hm,ix] = script
% this is a 3/4 rate decimate

close all;

%this is matlab version
l  = 3; m = 4;            % Interpolation/decimation factors.
%hm = dsp.FIRRateConverter(l,m);
hm = mfilt.firsrc(l,m);       % Use the default FIR filter.
fs = 48e3;                    % Original sample freq: 48 kHz.
n = 0:10239;                  % 10240 samples, 0.213 seconds long.
x  = sin(2*pi   *1e3/fs*n);      % Original signal, sinusoid at 1 kHz.
y = filter(hm,x);             % 9408 samples, still 0.213 seconds.
stem(n(1:49)/fs,x(1:49))      % Plot original sampled at 48 kHz.
hold on

%sounds the same as expected
%sound(x,fs);
%pause
%sound(y,fs*(l/m));

%create a decimation filter - note
%this is a crap filter length, hm above uses 96 coeffs
%hence this is why result not look good
%take a look at the coeffs in hm to see a better filter

b = fir1(11,1/4);

%so we first interpolate by factor of 3

del1 = zeros(1,l);
yo=[];
yr =[];
ix=0;
for i = 1: length(x)

    y1 = b(1) * x(i) + b(4) * del1(1) + b(7) * del1(2) + b(10) * del1(3);
    y2 = b(2) * x(i) + b(5) * del1(1) + b(8) * del1(2) + b(11) * del1(3);
    y3 = b(3) * x(i) + b(6) * del1(1) + b(9) * del1(2) + b(12) * del1(3);
    yo = [yo y1 y2 y3];


    del1(3) = del1(2);
    del1(2) = del1(1);
    del1(1) = x(i);
    %note yr does the downsampling for us - see lyons book
    if ix == 0
        yr = [yr y1];
    elseif ix == 1
        yr = [yr y2];
    else
        yr = [yr y3];
    end
    ix = mod(i*m,l);
end

%next we downsample by factor of 4

yf = downsample(yo,m);

% Plot fractionally decimated signal (44.1 kHz) in red
stem(n(1:45)/(fs*l/m),y(13:57),'r','filled')
xlabel('Time (sec)');ylabel('Signal Value')
figure(2);
subplot(411);
pwelch(x,[],[],[],fs,'twosided');
subplot(412);

pwelch(y,[],[],[],fs *(l/m),'twosided');
subplot(413);

pwelch(yf,[],[],[],fs *(l/m),'twosided');
subplot(414);

pwelch(yr,[],[],[],fs *(l/m),'twosided');
%
figure(3);
freqz(b,1,2048,fs);
