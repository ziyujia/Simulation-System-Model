function [data] = linear45(N,settleTime)
% function [data] = generateTimeSeries(N,settleTime,nonLinear)

% nonLinear = false;    %set to true for nonlinear model 非线性模型设置为true
% N=10000;             %number of points of simulated time series模拟时间序列点的数量
% settleTime=1000;    %settling time 安顿时间
%create a null distribution with randomized phases. this is not always
%necessary, since there is already the test on the coefficients, but it's good to have
%使用随机阶段创建一个空分布。 这并不总是必要的，因为已经对系数进行了测试，但是它很好
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = N + settleTime;
X = randn(4,N);  %正态分布的随机数 5*N的矩阵
r = sqrt(2);
    %%%%%% linear influences only  仅线性影响
for i=6:N
    X(1,i) = X(1,i) + 0.8.*X(1,i-1)+0.65.*X(2,i-4);
    X(2,i) = X(2,i) + 0.6.*X(2,i-1)+0.6.*X(4,i-5);
    X(3,i) = X(3,i) + 0.5.*X(3,i-3)-0.6.*X(1,i-1)+0.4.*X(2,i-4);
    X(4,i) = X(4,i) + 1.2.*X(4,i-1) - 0.7.*X(4,i-2);
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X = X(:,settleTime+1:end);
data=X';            %data matrix must have the dimensions [n_points n_variables]

return;