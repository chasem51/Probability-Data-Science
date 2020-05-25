clear all
close all
clc

% Parameters
numtrials = 1000;
alpha = 4;
b = 3;

X = random('Poisson',alpha, numtrials,1);

est=zeros(1,numtrials); % make all estimates 0
for m = 1:numtrials
    est(m) = length(find(X(1:m)>b))/m;
end

% calculate P[X>b]
prob_add=0;
for k=0:b
    prob_add=prob_add+((alpha^k*exp(-alpha))/factorial(k)); % P(X-0)+P(X-1)+P(X-2)+P(X-3)
end
ans=1-prob_add; % P(X>b)=1-P(X-0)+P(X-1)+P(X-2)+P(X-3)

% plot
hold off, plot(1:numtrials,est)
hold on, plot(1:numtrials, ans*ones(1,numtrials),'r--');
xlabel('Number of trials')
ylabel('Probability')
legend('Probability Estimate','Exact Probability')  