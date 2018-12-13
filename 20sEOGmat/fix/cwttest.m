load(".\Y\EOGYfix2\EOGYfix220s.mat");
plot(data20s(:,2));
hold on;
CWTcoeffs = cwt(data20s(:,2),1:128,'haar');
plot(CWTcoeffs(20,:),"red");
grid on;

CWTcoeffsh = cwt(data20s(:,1),1:128,'haar');
CWTcoeffsv = cwt(data20s(:,2),1:128,'haar');
cwth=CWTcoeffsh(20,:);
cwtv=CWTcoeffsv(20,:);

thsd=0.02;
sacstarth=[];
sacstartv=[];
saccounth=0;
saccountv=0;
 for i=1:size(cwth,2)
    if(cwth(i)>thsd||cwth(i)<-thsd)
       saccounth=saccounth+1;
    elseif(cwth(i)<=thsd&&cwth(i)>=-thsd&&saccounth>4)
       sacstarth=[sacstarth;i-saccounth i];
       saccounth=0;
    end
        
    if(cwtv(i)>thsd||cwtv(i)<-thsd)
       saccountv=saccountv+1;
    elseif(cwtv(i)<=thsd&&cwtv(i)>=-thsd&&saccountv>4)
       sacstartv=[sacstartv;i-saccountv i];
       saccountv=0;
    end
end
% [f,xi]=ksdensity(sacstarth);
% y=[f;xi];
% [f,xi]=ksdensity(sacstartv);
% y=[y;f;xi];
plot(sacstartv(:,1),zeros(size(sacstartv,1),1),'.');
plot(sacstartv(:,2),zeros(size(sacstartv,1),1),'x');

% thfd=0.03;
% fixstarth=[];
% fixstartv=[];
% fixcounth=0;
% fixcountv=0;
% for i=1:size(cwth,2)
%         if(cwth(i)<=thfd&&cwth(i)>=-thfd)
%             fixcounth=fixcounth+1;
%         elseif((cwth(i)>thfd||cwth(i)<-thfd)&&fixcounth>40)
%             fixstarth=[fixstarth;i-fixcounth i];
%             fixcounth=0;
%         end
%         
%         if(cwtv(i)<=thfd&&cwtv(i)>=-thfd)
%             fixcountv=fixcountv+1;
%         elseif((cwtv(i)>thfd||cwtv(i)<-thfd)&&fixcountv>40)
%             fixstartv=[fixstartv;i-fixcountv i];
%             fixcountv=0;
%         end
% end
% plot(fixstarth(:,1),zeros(size(fixstarth,1),1),'.');
% plot(fixstarth(:,2),zeros(size(fixstarth,1),1),'x');