function [H4] = script
close all;

R=32;%decimation rate
D=2;%delay in comb
S=3;%number of stages
RD = R*D;

b1 = [1 zeros(1,RD-1) -1] * 1/RD; 
a1 = [1 -1];

b2 = [1 zeros(1,RD-1) -1] * 1/RD; 
a2 = [1 -1];

b3 = [1 zeros(1,RD-1) -1] * 1/RD; 
a3 = [1 -1];

%this is coefficent if we downsample after
%integrator
bd = [1 zeros(1,D-1) -1] * 1/RD;

H1 = dfilt.df1(b1,a1);
H2 = dfilt.df1(b2,a2);
H3 = dfilt.df1(b3,a3);
H4 = cascade(H1,H2,H3);


%fvtool(H4);

%create impulse signal
N=600; %signal length
imp = [1 zeros(1,N-1)];
step = ones(1,N);
yi = filter(H4,imp);
ys = filter(H4,step);

%downsample now
yid = downsample(yi,R);
ysd = downsample(ys,R);

figure(1);
subplot(211);
plot(yid);
title('impulse response');
subplot(212);
plot(ysd);
title('step response');
%frequency response
H4.freqz

%now implement above explicity
yei = cic_filter_cascade(b1,a1,imp,S,R);
yes = cic_filter_cascade(b1,a1,step,S,R);
yci = combined_cic(bd,imp,S,R);
ycs = combined_cic(bd,step,S,R);

figure(3);
subplot(211);
plot(yei);
title('explicit impulse response');
subplot(212);
plot(yes);
title('explicit step response');

figure(4);
subplot(211);
plot(yci);
title('combined explicit impulse response');
subplot(212);
plot(ycs);
title('combined explicit step response');




end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%explicit cic filter implemtation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = cic_filter(b,a,x)
LENDX = length(b)-1;
LENDY = length(a) -1;
delx = zeros(1,length(b)-1);
dely = 0;

for i = 1:length(x)
    temp1 = x(i) * b(1);
    %b(LENDX) to b(2) are zeros so no need to multiply
    temp1 = temp1 + b(LENDX+1) * delx(LENDX)
    for j = LENDX :-1:2
    %    temp1 = temp1 + (delx(j) * b(j+1));
        delx(j) = delx(j-1);
    end
    %b(2) is zero so no need
    %temp1 = temp1 + delx(1) * b(2);
    temp2  = dely * a(2);
    out(i) = temp1 - temp2;
    dely = out(i);
    delx(1) = x(i);
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cic filter cascade
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = cic_filter_cascade(b,a,x,n,R)
for i = 1: n
    y = cic_filter(b,a,x);
    x=y;
end
y = downsample(y,R);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this just implements the integrator part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = integrator_part(x)
dely = 0;
for i = 1:length(x)
    if 0
    temp2 = dely * a(2);
    y(i) = x(i) - temp2;
    dely=y(i);
    end
    %simplified to 
    y(i) = x(i) + dely;
    dely = y(i);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function just implements integrator cascade
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = integrator_cascade(x,n)
y = 0;
for i = 1:n
    y = integrator_part(x);
    x=y;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this just implements the comb part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = comb_part(b,x)
LENDX = length(b) -1;
delx = zeros(1,LENDX);
for i = 1:length(x)
    temp1 = x(i) * b(1);
    %b(LENDX) to b(2) are zeros so no need to multiply
    y(i) = temp1 + b(LENDX+1) * delx(LENDX);
    for j = LENDX :-1:2
    %    temp1 = temp1 + (delx(j) * b(j+1));
        delx(j) = delx(j-1);
    end
    %b(2) is zero so no need
    %temp1 = temp1 + delx(1) * b(2);
    delx(1) = x(i);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this implements the comb cascade
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = comb_cascade(b,x,n)
y = 0;
for i=1:n
    y = comb_part(b,x);
    x=y;
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this implements the complete cic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = combined_cic(b,x,n,R)
%first the integrator cascade
y1 = integrator_cascade(x,n);
%now the downsample part
%now the comb part
y2 = downsample(y1,R);
y = comb_cascade(b,y2,n);
end
