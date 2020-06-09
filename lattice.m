function xM = lattice(m,c,n,x0M)
% INPUTS
% - m   : the number of coupled maps (time series)
% - c   : the coupling strength
% - n   : the time series length
% - x0M : initial conditions, a matrix of size 2 x m
% OUTPUTS
% - xM  : the n x m matrix of the generated time series
f=@(x)(1-2*abs(0.5-x));%定义符号表达式
if nargin<=3              %鍒ゆ柇杈撳叆鍙橀噺鐨勪釜鏁?
    x0M = NaN;
end
if length(c)==1                     %c鐨勯暱搴︿负1鏃讹紝鐢熸垚涓?涓猰*1鐨勫垪鍚戦噺
    cV = c*ones(m,1);
else
    cV = c;
end
if isnan(x0M)               %  x0M鏄疦AN鏃讹紝杩涜濡備笅璁＄畻
    ntrans = 10000;
    %x0limV = [-1 1]'; % -1,0.01是一个可以参考的值，别的值也能尝试 
    xM = NaN*ones(n+ntrans,m);
    %tmpM = rand(1,m);  %  闅忔満浜х敓2*m鐭╅樀锛屼骇鐢燂紙0,1锛夐殢鏈烘暟
    %xM(1,:)=(x0limV(2)-tmpM(1,:))/(x0limV(2)-x0limV(1));%鍒╃敤闅忔満鐭╅樀tmpM浠ュ強x0limV鐢熸垚xM鐨勭浜岃
    xM(1,:) = rand(1,m);
else
    ntrans = 2;
    xM(1:2,:)= x0M;   % 锛?
end
for t=2:n+ntrans
    xM(t,1)=f(cV(1)*xM(t-1,m)+(1-cV(1))*xM(t-1,1));
    for im=2:m
        xM(t,im)=f(cV(im)*xM(t-1,im-1)+(1-cV(1))*xM(t-1,im));
    end
end
xM = xM(ntrans+1:n+ntrans,:);

