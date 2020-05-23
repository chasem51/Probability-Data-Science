% declaring variables

k = 80;
l = 100;
numtrials = 50;

X = random('Discrete Uniform',l - k + 1,numtrials,1) + k - 1;

%Calculate sample mean

samplemean = zeros(1,numtrials);

for m = 1:numtrials
    sumData = 0
    for i = 1:m
        sumData = sumData + X(i);
    end
    samplemean(m) = sumData/m;
end

%Plot sample mean vs. number of trials.

plot(1:numtrials,samplemean)

xlabel('Number of Trials')

ylabel('Sample Mean')