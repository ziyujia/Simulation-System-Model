function xM = logistic(m,c,n,noise,aV,x0M)
% INPUTS
% - m       : the number of coupled maps (time series)
% - c       : the coupling strength
% - n       : the time series length
% - noise   : noise to add
% - aV      : the two parameters in a vector (if omitted the standard
%         parameters for chaos are chosen)
% - x0M     : initial conditions, a matrix of size 2 x m
% OUTPUTS
% - xM      : the n x m matrix of the generated time series
% Reference
% Antonio Politi and Alessandro Torcini
% Periodic orbits in coupled H?non maps: Lyapunov and multifractal analysis
% Chaos 2, 293 (1992); doi:10.1063/1.165871 (8 pages)
% Xunhe Yin  Yong Rena and Xiuming Shana
% Synchronization of discrete spatiotemporal chaos by using variable structure control
% Chaos, Solitons & Fractals, Volume 14, Issue 7, October 2002, Pages 1077-1082

if nargin<=5
    x0M = NaN;
end
if nargin<=3
    noise=0;
end
if nargin<=2
    n = 512;
end
if nargin<=1
    c=0.2;
end
if nargin<=4
    aV = [1 -1.8 0.01];
end
if nargin<=0
    m=5;
end    
if isempty(aV)
    aV = [1.4 0.3];
end  
if length(c)==1
    cV = c*ones(m,1);
else
    cV = c;
end
if isnan(x0M)
    ntrans = 1000;
    x0limV = [-1.8 1.8]';
    xM = NaN*ones(n+ntrans,m);
    tmpM = rand(1,m);
    xM(1,:)=(x0limV(2)-tmpM(1,:))/(x0limV(2)-x0limV(1));
else
    ntrans = 2;
    xM(1:2,:)= x0M;
end
for t=2:n+ntrans
    xM(t,1)= aV(1) + aV(2)*xM(t-1,1)^2 + noise*rand(1);
    for im=2:m
        xM(t,im)= (aV(1)-cV(im))*(aV(1)+aV(2)*xM(t-1,im)^2)+ ...
            cV(im)*(aV(1)+aV(2)*xM(t-1,im-1)^2) + noise*rand(1);
    end
end
xM = xM(ntrans+1:n+ntrans,:);