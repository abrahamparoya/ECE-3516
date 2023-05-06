clc
clear all
close all
load message_1.mat

x=tone;
[m,n]=size(x);
dt=1/fs;
t=dt*(0:n-1);
%  figure
%  plot(t,x);

%%
 idx = t<0.05 ;  %TONE 1
% idx = 0.05<t<0.1 ;   % TONE 2
% idx = 0.1<t<0.15 ;   % TONE 3
%  idx = 0.15<t<0.2 ;   % TONE 4
% idx = 0.2<t<0.25 ;   % TONE 5
%   idx = 0.25<t<0.3 ;   % TONE 6
%   idx = 0.3<t<0.35 ;   % TONE 7
%   idx = 0.35<t<0.4 ;   % TONE 8
%   idx = 0.4<t<0.45 ;   % TONE 9
%    idx = 0.45<t<0.5 ;   % TONE 10
%   idx = 0.5<t<0.6 ;   % TONE 11
%      idx = 0.6<t<0.65 ;   % TONE 12
%        idx = 0.65<t<0.7 ;   % TONE 13
%          idx = 0.7<t<0.75 ;   % TONE 14
%          idx = 0.75<t<0.8 ;   % TONE 15
x50 = x(idx) ;

[X f ABSSS FFF] = myFFT1(x50,fs);
[A B]=max(ABSSS);
FFF(B)

%%
frac_of_1sec=50e-3/1
fifty_ms_sample=frac_of_1sec*fs
total50mstones=length(tone)/fifty_ms_sample




