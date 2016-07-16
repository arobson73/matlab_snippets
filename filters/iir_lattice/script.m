function [y,K,V] = script(filename)
close all;
%first create a simple iir

b = [0.2759 0.5121 0.5121 0.2759];
a = [1 -0.0010 0.6546 -0.0775];

Hd = dfilt.df1(b,a);

fvtool(b,a);

y=1;

%create an impulse
imp = zeros(1,2000);
imp(1)=1;
%create a step response
step = ones(1,2000);

%open the input data
filename_double = strcat(filename,'_double.pcm');
fid = fopen(filename_double,'rb');
dtm = fread(fid,'double');
fprintf('\n%d bytes read from %s\n',length(dtm)*8,filename_double);
fclose(fid);



sig = imp;

%filter it with matlabs

y = filter(Hd,sig);

%now create lattice coeffs
[K,V] = tf2latc(b,a);

yL = latcfilt(K,V,sig);

%now implement this lattice explicitly (see schaums dsp book)
yE = newLattice(K,V,sig);


figure(2);
subplot(311);
plot(y);
title('matlab direct form iir');
subplot(312);
plot(yL);
title('lattice iir');
subplot(313);
plot(yE);
title(' my lattice ');

%looks at power spectrum
figure(3);
subplot(211);
pwelch(yL,[],[],[],8000,'onesided');
subplot(212);

pwelch(yE,[],[],[],8000,'onesided');

end

function y= newLattice(K,V,x)
K1=K(3);
K2=K(2);
K3=K(1);
V1=V(4);
V2=V(3);
V3=V(2);
V4 = V(1);
U1d=0;
U2d=0;
X3d=0;

for i = 1:length(x)
    X1 = x(i) - K1*U1d;
    X2 = X1 - K2*U2d;
    X3 = X2 - K3*X3d;
    U1 = U2d + K2*X2;
    U2 = X3d + K3*X3;
    W1 = (U1d + K1*X1)*V1;
    W2 = U1*V2 + W1;
    W3 = U2*V3 + W2;
    y(i) = X3*V4 + W3;
    U1d=U1;
    U2d=U2;
    X3d=X3;
end
end

