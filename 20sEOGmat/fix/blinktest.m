load(".\Y\EOGYfix10\EOGYfix1020s.mat");
plot(data20s(:,2));
hold on;
% CWTcoeffs = cwt(data20s(:,2),1:128,'haar');
% plot(CWTcoeffs(20,:),'.');
grid on;

CWTcoeffsv = cwt(data20s(:,2),1:128,'haar');
cwtv=CWTcoeffsv(20,:);

thsd=0.06;
sacpeakv=[];
saccountv=[];
for i=1:size(cwtv,2)
    if(cwtv(i)>thsd||cwtv(i)<-thsd)
       saccountv=[saccountv;cwtv(i)];
    elseif(cwtv(i)<=thsd&&cwtv(i)>=-thsd)
       if(max(saccountv)>0)
           loc=(i-size(saccountv,1)-1+find(saccountv==max(saccountv),1));
           sacpeakv=[sacpeakv;max(saccountv) loc];
       elseif(min(saccountv)<0)
           loc=(i-size(saccountv,1)-1+find(saccountv==min(saccountv),1));
           sacpeakv=[sacpeakv;min(saccountv) loc];
       end
       saccountv=[];
    end
end

blinkstart=[];
curpeak=[0 0];
for j=1:size(sacpeakv,1)
    if(sacpeakv(j,1)<0)
        curpeak(1,1)=sacpeakv(j,1);
        curpeak(1,2)=sacpeakv(j,2);
    elseif(sacpeakv(j,1)>0)
        if(curpeak(1,1)<0&&(sacpeakv(j,2)-curpeak(1,2))<100)
            blinkstart=[blinkstart;curpeak(1,2)];
        end
        curpeak=[0 0];
    end
end
% [f,xi]=ksdensity(sacstarth);
% y=[f;xi];
% [f,xi]=ksdensity(sacstartv);
% y=[y;f;xi];
plot(blinkstart(:,1),zeros(size(blinkstart,1),1),'o');