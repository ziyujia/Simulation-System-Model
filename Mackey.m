function xM = Mackey(n)
% Example: Compute PMIME and PMIMEsig on a multiple time series generated
% by the coupled Henon maps
K = 3; % When data are to be generated, number of variables  K个变�??
C= 0.2; % 耦合强度
nnei = 5; % Number of nearest neighbors for PMIME �??��邻个�??
Lmax = 15; % The window size to search for components for MIME  时间
thresh = 0.03; % The fixed hresholds for terminartion of MIME,PMIME (as proportion)
T = 1; % The prediction time for PMIME
nsur = 100;
alpha = 0.05; % The adjusted threshold for for termination of MIME,PMIME
toplot = 1;
cax = [0 0.07];
figno=0;
temp=load('MGD50D75D100.dat');
maxrow=512;
xM=zeros(maxrow,3);
for j=1:n
    xM(1:maxrow,j)=temp((j-1)*maxrow+1:(j-1)*maxrow+maxrow);
end



