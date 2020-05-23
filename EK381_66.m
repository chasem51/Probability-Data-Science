close all
clear
clc

%part a
fprintf('Part a)\n')
Z = randn(2000,2);
W = Z(:,1);
V = Z(:,2);
CZ = cov(Z);
disp('Cov[Z] = '),disp(CZ)

%part b
figure, scatter(W,V)
xlabel('W')
ylabel('V')
title('Scatter Plot for b)')

%part c
X = 1 + W;
Y = -3*V + 1;
figure, scatter(X,Y)
xlim([-10,10])
ylim([-10,10])
xlabel('X')
ylabel('Y')
title('Scatter plot for c)')

%part d
fprintf('Part d) \n')
CXY = cov([X,Y]);
disp('Cov[X,Y] = '),disp(CXY)

% part e
fprintf('Part (e)\n')
disp('Cov[P,Y] =')
P = 2*X+Y;
e = cov(P,Y);
disp(e)

% part f
fprintf('Part (f)\n')
y = mean(Y);
disp('E[Y] =')
disp(y)
p = mean(P);
disp('E[P] =')
disp(p)
y2 = mean(Y.^2);
p2 = mean(P.^2);
vary = y2 - y^2;
disp('Var[Y] =')
disp(vary)
varp = p2 - p^2;
disp('Var[P] =')
disp(varp)
covy = cov(Y);
disp('Cov[Y] =')
disp(covy)
covp = cov(P);
disp('Cov[P] =')
disp(covp)

%part g
Y=2;
mean(P)

% part h
I = find((Y < 2.05)&(Y>1.95));
aveP = sum(P(I))/size(I,1)

%part i
Ep = mean(P); 
Ey = mean(Y); 
varY = var(Y);

covPY = cov(P,Y); 
%EPY2 = Ep + (covPY(1,2)/varY)*(2 - Ey)