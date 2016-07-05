function y = elapsed_time(d1,d2)

%Given two date strings d1 and d2 of the form yyyy/mm/dd HH:MM:SS (assume hours HH is in 24 hour mode), determine how much time, in decimal hours, separates them. Assume d2 is always later than d1.

%Example:
% Input d1 = '2010/12/14 12:00:00'
% Input d2 = '2010/12/14 13:06:36'
% Output elapsed is 1.11
d1s = strsplit(d1);
d2s = strsplit(d2);
d1a=[];
d1b=[];
d2a=[];
d2b=[];
d1s_yr_mon_date = strsplit(cell2mat(d1s(1)),'/');
d1s_hr_min_sec = strsplit(cell2mat(d1s(2)),':');
d2s_yr_mon_date = strsplit(cell2mat(d2s(1)),'/');
d2s_hr_min_sec = strsplit(cell2mat(d2s(2)),':');


for i= 1:3
    d1a = [d1a str2num(cell2mat(d1s_yr_mon_date(i)))];
    d1b = [d1b str2num(cell2mat(d1s_hr_min_sec(i)))];
    d2a = [d2a str2num(cell2mat(d2s_yr_mon_date(i)))];
    d2b = [d2b str2num(cell2mat(d2s_hr_min_sec(i)))];


end
y = etime([d2a d2b],[d1a d1b])/3600;

