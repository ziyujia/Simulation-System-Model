function xM = syn(time_length)
    if nargin < 1
        time_length = 1024;
    end
    ntrans = 1000;
    xM = zeros(time_length+ntrans,10);
    %W1,W2,W3,W4
    xM(:,1) = randn(time_length+ntrans,1);
    xM(:,2) = randn(time_length+ntrans,1);
    xM(:,3) = randn(time_length+ntrans,1);
    xM(:,4) = randn(time_length+ntrans,1);
    %Z1,Z2,Z3
    xM(:,5) = randn(time_length+ntrans,1);
    xM(:,6) = randn(time_length+ntrans,1);
    xM(:,7) = randn(time_length+ntrans,1);
    %xM[:,7] =  randn(time_length,1)
    a = 0.4;
    b = 2;
    c = 0.4;
    alpha = 0.5;
    xM(2,8) = a*(xM(1,1) + xM(1,3)) + randn(1);
    xM(2,9) = a*(xM(1,2) + xM(1,4)) + randn(1);
    for t=3:time_length+ntrans
        xM(t,8) = a*(xM(t-1,1) + xM(t-1,3)) + randn(1);
        xM(t,9) = a*(xM(t-1,2) + xM(t-1,4)) + randn(1);
        for i =1:4
            xM(t,10) = xM(t,10) + c * xM(t-2,i);
        end
        tempZ = b;
        for i =5:7
            tempZ = tempZ * xM(t-2,i);
        end
        xM(t,10) = xM(t,10) + tempZ;
        xM(t,10) = xM(t,10) + alpha * randn(1);
    end
    xM = xM(ntrans+1:time_length+ntrans,:);

