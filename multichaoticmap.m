function data = multichaoticmap(n,c,s,eps,mu)
% eps              : 1 logistica  eps=0 tenda mu in [0,2]
% mu               : default 1.8  默认1.8 β
% c                : square matrix  方阵
% n                : 长度
% s                : 高斯噪音的一个系数
    nvar = length(c);
    nt   = 1000;
    xx   = zeros(nvar,n+nt);
    cp   = c+diag(1-sum(c));
    disp(cp)
    test = 0.5;
    
    if (nargin < 5)
        mu = 1.8;
    end
    
    while test>0
        nn       = s*randn(nvar,n+nt-1);
        xx(:,1)  = rand(nvar,1);
        for i = 2:n+nt
            xx(:,i)    = cp'*(1-mu*abs(xx(:,i-1)).^(1+eps))+nn(:,i-1);  %2^-52
        end
        X     = xx(:,nt:n+nt-1);
        test  = isinf(max(max(abs(xx)))^2);
        if(test == 1)       
            disp('the series tends towards infinite values');
            data = [];
            return;
%             break;
        else
%             figure
%             plot(X(1,:));
        end
    end
    data=zscore(X');  %标准化的z分数

return;