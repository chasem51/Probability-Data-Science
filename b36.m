clear all
close all
clc

n=10;
p=0.5;

for numtrails=[100 1000 10000] % experiments will be carried out with 100, 1000 and 10,000 trails
  
    X= binornd(n,p,[numtrails,1]);
    counts=zeros(1,n+1);
    for i=0:n
        counts(i+1)=length(find(X==i)); % no. of occurence of value i in X
    end
    normalizedcounts=counts/numtrails; % normalize the counts of value i in X
  
% Probablity Mass Function
    pmfvalues=zeros(1,n+1);
    for i=0:n
        pmfvalues(i+1)=nchoosek(n,i)*p^(i)*(1-p)^(n-i); % pmf for ith value=nCk*p^k*(1-p)^(n-k)
    end
  
% Plot
figure;
colormap([0.5 0.7 0.9]); % Lighten default colour plot
hold off
bar(0:n,normalizedcounts) % bars plot for normalized counts
hold on
stem(0:n,pmfvalues,'b','linewidth',2); % plot pmf values in form of stem plot
xlabel('x'); % x-label
ylabel('Probablity') % y-label
legend('Normalized Histograms','PMF'); % legend of plot
  
title(sprintf('%i Binomial Trails\n',numtrails)); % display the tile of each figure
end

