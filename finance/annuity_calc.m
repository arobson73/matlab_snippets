function [y,m] = annuity_calc(PV, rate, period)
%Pv is present value, e.g you have 20k.
%rate is annual annuity rate. eg 2%
%period is number of years for annuity to run
%y is yearly return
%m is monthly return
rm = (rate/12)/100; 
ml = -period * 12;
m = (PV * rm)/ (1 - (1 + rm)^ml);
y = m*12;
