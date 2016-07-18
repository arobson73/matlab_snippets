function [x,y,b,yd,ye] = script
%this is matlab demo of decimate
close all;
t = 0:.00025:1;  % Time vector
x = sin(2*pi*30*t) + sin(2*pi*60*t);
%x = sin(2*pi*300*t) + sin(2*pi*600*t);
Fs=4000;
D=4;
mx = max(abs(x));%do this to keep amplitude in -1 to +1 otherwise sound will be clipped
x = x/mx;
sound(x,Fs);
pause
y = decimate(x,D);
max(abs(y))
figure(1);
subplot(1,2,1);
stem(x(1:120)), axis([0 120 -2 2])   % Original signal
title('Original Signal')
subplot(1,2,2);
stem(y(1:30))                        % Decimated signal
title('Decimated Signal')

%now try an explicit polyphase decimator look in lyons book
%note a longer filter would be better
b = fir1(11,1/4);
fvtool(b);

del1 = zeros(1,2);
del2 = zeros(1,2);
del3 = zeros(1,2);
del4 =zeros(1,2);
count=0;
ye=[];
for i=1:length(x)
    if count == 0
        y0 = b(1) * x(i) + del1(1)*b(5) + del1(2)*b(9);
        del1(2) =del1(1);
        del1(1) = x(i);
    elseif count == 1
        y1   = b(2) * x(i) + del2(1)*b(6) + del2(2)*b(10);
        del2(2) = del2(1);
        del2(1) = x(i);
    elseif count == 2
        y2 = b(3) * x(i) + del3(1)*b(7) + del3(2)*b(11);
        del3(2) = del3(1);
        del3(1) = x(i);
    else
        y3 = b(4) *x(i) + del4(1)*b(8) + del4(2)*b(12);
        del4(2) = del4(1);
        del4(1) = x(i);
        ye = [ye (y0 + y1 + y2 + y3)];
    end
    count = count + 1;
   count = mod(count,4); 

end
%look at spectrum before and after
Fs=4000;
figure(2);
subplot(141);
pwelch(x,[],[],[],Fs,'twosided');
subplot(142);
pwelch(y,[],[],[],Fs/4,'twosided');
subplot(143);
sound(y,Fs/D);
pause
%try downsample also, note this is also fine so 
%seeing as the max freq is quite low compared to 
%sample frequency, there is no need to filter first
yd = downsample(x,D);
sound(yd,Fs/D);
pwelch(yd,[],[],[],Fs/4,'twosided');

subplot(144);
pwelch(ye,[],[],[],Fs/4,'twosided');


