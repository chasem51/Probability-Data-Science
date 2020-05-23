close all
clear
clc

%part a
fprintf('Part a)\n')
z = randn(2000,2);
W = Z(:,1);
V = Z(:,2);
CZ = cov(Z);
disp('Covariance matrix of Z = '),disp(CZ)

%part b