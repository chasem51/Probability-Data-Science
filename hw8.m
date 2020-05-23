close all;
load gaussiandata

n = length(partc_H0_data);

for i = 1:3
    if(i==1),
        H0_data = parta_H0_data;
        H1_data = parta_H1_data;
    elseif(i == 2),
        H0_data = partb_H0_data;
        H1_data = partb_H1_data;
    elseif(i == 3),       
        H0_data = partc_H0_data;
        H1_data = partc_H1_data;
    end
    
    mX0 = 1/n*sum(H0_data(:,1));
    mY0 = 1/n*sum(H0_data(:,2));
    mX1 = 1/n*sum(H1_data(:,1));
    mY1 = 1/n*sum(H1_data(:,2));
    VarX = (1/(2*n)) * (sum((H0_data(:,1) - mX0.^2) + sum((H1_data(:,1) - mX1).^2)));
    VarX = (1/(2*n)) * (sum((H0_data(:,2) - mX0.^2) + sum((H1_data(:,2) - mY1).^2)));
    CovXY = (1/(2*n)) * (sum((H0_data(:,1) - mX0).*(H0_data(:,2) - mY0))...
        + sum((H1_data(:,1) - mX1).*(H1_data(:,2) - mY1)));
    
    Sigma = [VarX CovXY; CovXY VarY];
    m0 = [mX0;mY0];
    m1 = [mX1;mY1];
    iSigma = inv(Sigma);
    d = (m1-m0)' * iSigma;
    a = d(1); b = d(2);
    c = 0.5*(m0' * iSigma * m0 - m1' * iSigma * m1);
    count = 0;
    H0errors = (a*H0_data(:,1)+b*H0_data(:,2)+c > 0);
    H1errors = (a*H1_data(:,1)+b*H1_data(:,2)+c < 0);
    
    PFA = sum(H-errors)/n
    PMD = sum(H1errors)/n
    Pe = 0.5*(PFA + PMD)
    x = linspace(-8,8,500);
    y = -a/b * x - c/b;
    
    figure()
    hold off
    plot(H0_data(:,1),H0_data(:,2),'x','Color','k','MarkerSize',6)
    hold on  
    plot(H1_data(:,1),H1_data(:,2),'x','Color','r','MarkerSize',6)
    plot(x,y,'g','linewidth',2)
    xlabel('x')
    ylabel('y')
    legend('H0','H1')
    axis([-8 8 -8 8])
    axis square
end
        
            