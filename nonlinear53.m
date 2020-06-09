function [data] = nonlinear53(N,settleTime)
% function [data] = generateTimeSeries(N,settleTime,nonLinear)

% nonLinear = false;    %set to true for nonlinear model 非线性模型设置为true
% N=10000;             %number of points of simulated time series模拟时间序列点的数量
% settleTime=1000;    %settling time 安顿时间
%create a null distribution with randomized phases. this is not always
%necessary, since there is already the test on the coefficients, but it's good to have
%使用随机阶段创建一个空分布。 这并不总是必要的，因为已经对系数进行了测试，但是它很好
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = N + settleTime;
X = randn(5,N);  %正态分布的随机数 5*N的矩阵
r = sqrt(2);  
    %%%%%% nonlinear case, so you can see that it works better with p=2 非线性情况，所以你可以看到它在p = 2时效果更好
for i=4:N
   X(1,i) = X(1,i) + 0.95.*r.*X(1,i-1) - 0.9025.*X(1,i-2);
   X(2,i) = X(2,i) + 0.5.*X(1,i-2)^2;
   X(3,i) = X(3,i) - 0.4.*X(1,i-3);
   X(4,i) = X(4,i) - 0.5.*X(1,i-2)^2 + 0.25.*r.*X(4,i-1) + 0.25.*r.*X(5,i-1);
   X(5,i) = X(5,i) - 0.25.*r.*X(4,i-1) + 0.25.*r.*X(5,i-1);
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = X(:,settleTime+1:end);
data=X';            %data matrix must have the dimensions [n_points n_variables]

return;