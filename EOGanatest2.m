load("EOGLfix120s");
h1=data20s;
load("EOGLfix220s");
v1=data20s;
derivh=diff(h1);
maxh=[];
derivv=diff(v1);
maxv=[];
for i=1:size(derivh,1)
    if(derivh(i)==0&&h1(i)>0)
          maxh=[maxh;h1(i)];
    end
    if(derivv(i)==0&&v1(i)>0)
          maxv=[maxv;v1(i)];
    end
end
[f,xi]=ksdensity(maxh);
plot(xi,f);
hold on;
[f,xi]=ksdensity(maxv);
plot(xi,f);