load("EOGtest2");
h1=data(1:2000);
load("EOGtest3");
v1=data(1:2000);
maxH=max(h1);
minH=min(h1);
maxV=max(v1);
minV=min(v1);

[f,xi]=ksdensity(h1);
save('distriH1f.mat','f');
save('distriH1xi.mat','xi');
[f,xi]=ksdensity(v1);
save('distriV1f.mat','f');
save('distriV1xi.mat','xi');
%plot(xi,f);