% FLD demo
clear all; close all; clc
% Asama 1: data
c1=[[1 2];[2 3];[3 3];[4 5];[5 5]]
c2=[[1 0];[2 1];[3 1];[3 2];[5 3];[6 5]]

% Asama 2: mu
mu1 = mean(c1)'
mu2 = mean(c2)'

% Asama 3: scatter
S1 = (size(c1,1) - 1) * cov(c1) 
S2 = (size(c2,1) - 1) * cov(c2)

Sw = S1 + S2
iSw = inv(Sw)

% Asama 4: v - optimal line direction
v = iSw * (mu1 - mu2)

% Asama 5: project
Y1 = v' * c1'
Y2 = v' * c2'

% Asama 6: plot
plot(c1(:,1), c1(:,2), '*r');
hold on
plot(c2(:,1), c2(:,2), '*b');
hold off
axis([-1 7 -1 7]);