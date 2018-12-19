load(".\Y\EOGYfix10\EOGYfix1020s.mat");
plot(data20s(1900:4000,2));
hold on;
grid on;
% CWTcoeffs = cwt(data20s(:,2),1:128,'haar');
% plot(CWTcoeffs(20,:),"red");

CWTcoeffsh = cwt(data20s(1:1980,1),1:128,'haar');
CWTcoeffsv = cwt(data20s(1900:4000,2),1:128,'haar');
cwth=CWTcoeffsh(20,:);
cwtv=CWTcoeffsv(20,:);

thsd=0.03;
sacstarth=[];
sacstartv=[];
saccounth=0;
saccountv=0;
for i=1:size(cwth,2)
    if(cwth(i)>thsd||cwth(i)<-thsd)
       saccounth=saccounth+1;
    elseif(cwth(i)<=thsd&&cwth(i)>=-thsd)
       if(saccounth>4)
           sacstarth=[sacstarth;i-saccounth i];
       end
       saccounth=0;
    end
end
% plot(sacstarth(:,1),zeros(size(sacstarth,1),1),'o');
% plot(sacstarth(:,2),zeros(size(sacstarth,1),1),'x');

for j=1:size(cwtv,2)
    if(cwtv(j)>thsd||cwtv(j)<-thsd)
       saccountv=saccountv+1;
    elseif(cwtv(j)<=thsd&&cwtv(j)>=-thsd)
       if(saccountv>4)
           sacstartv=[sacstartv;j-saccountv j];
       end
       saccountv=0;
    end
end
plot(sacstartv(:,1),zeros(size(sacstartv,1),1),'o');
plot(sacstartv(:,2),zeros(size(sacstartv,1),1),'x');

% thfd=0.03;
% fixstarth=[];
% fixstartv=[];
% fixcounth=0;
% fixcountv=0;
% for i=1:size(cwth,2)
%         if(cwth(i)<=thfd&&cwth(i)>=-thfd)
%             fixcounth=fixcounth+1;
%         elseif((cwth(i)>thfd||cwth(i)<-thfd))
%             if(fixcounth>40)
%                fixstarth=[fixstarth;i-fixcounth i];
%             end
%             fixcounth=0;
%         end
%         
%         if(cwtv(i)<=thfd&&cwtv(i)>=-thfd)
%             fixcountv=fixcountv+1;
%         elseif((cwtv(i)>thfd||cwtv(i)<-thfd))
%             if(fixcountv>40)
%                 fixstartv=[fixstartv;i-fixcountv i];
%             end
%             fixcountv=0;
%         end
% end
% plot(fixstarth(:,1),zeros(size(fixstarth,1),1),'.');
% plot(fixstarth(:,2),zeros(size(fixstarth,1),1),'x');