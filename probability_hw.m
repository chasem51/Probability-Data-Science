Z = randn(2000,2);
W = Z(:,1); 
V = Z(:,2);
fprintf('Part (a)\n------------------------------------------\n')
disp('Covariance Matrix of Z =')
a = cov(Z);
disp(a)
scatter(W,V);
X = 1 + W;
Y = -3 * V + 1;
figure
scatter(X,Y); 
xlim([-10,10]); 
ylim([-10,10]);
fprintf('Part (d)\n------------------------------------------\n')
disp('Covariance Matrix of [X,Y] =')
d = cov(X,Y);
disp(d)
P = 2 * X + Y;
figure
scatter(P,Y); 
fprintf('Part (e)\n------------------------------------------\n')
disp('Covariance Matrix of [P,Y] =')
P = 2*X+Y;
e = cov(P,Y);
disp(e)
fprintf('Part (f)\n------------------------------------------\n')
y = mean(Y);
disp('Theoretical Expected Value of Y =')
disp(y)
p = mean(P);
disp('Theoretical Expected Value of P =')
disp(p)
y2 = mean(Y.^2);
p2 = mean(P.^2);
vary = y2 - y^2;
disp('Theoretical Variance of Y =')
disp(vary)
varp = p2 - p^2;
disp('Theoretical Variance of P =')
disp(varp)
covy = cov(Y);
disp('Theoretical Covariance of Y =')
disp(covy)
covp = cov(P);
disp('Theoretical Covariance of P =')
disp(covp)
Y=2;
mean(P)
I = find((Y < 2.05)&(Y>1.95));
aveP = sum(P(I))/size(I,1)

Ep = mean(P); 
Ey = mean(Y); 
varY = var(Y);
covPY = cov(P,Y); 
EPY2 = Ep + (covPY(1,2)/varY)*(2 - Ey)
