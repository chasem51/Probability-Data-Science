%Parameters
n = 10;
p = 0.5;
numtrials = 100;

%Generate Binomial RVs
X = random('Binomial',n,p,numtrials,1)

%Plot
stem(X)
axis([1 numtrials 0 n])
xlabel('Trial Number')
ylabel('X')
title('100 realizations of a Binomial b(10,.5');
