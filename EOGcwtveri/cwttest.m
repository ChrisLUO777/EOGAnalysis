load(".\Yi\EOGYifix10\EOGYifix1020s.mat");
plot(data20s(:,1));
hold on;
grid on;
CWTcoeffs = cwt(data20s(:,1),1:128,'haar');%horizontal cwt
plot(CWTcoeffs(20,:),"red");

CWTcoeffsh = cwt(data20s(:,1),1:128,'haar');
CWTcoeffsv = cwt(data20s(:,2),1:128,'haar');
cwth=CWTcoeffsh(20,:);
cwtv=CWTcoeffsv(20,:);

thsd=0.03;
sacstarth=[];
sacstartv=[];
saccounth=0;
saccountv=0;
fixcounth=0;
fixcountv=0;
for i=1:size(cwth,2)
    if(cwth(i)>thsd||cwth(i)<-thsd)
        if(fixcounth>0)
            saccounth=saccounth+fixcounth;
            fixcounth=0;
        end
        saccounth=saccounth+1;
    elseif(cwth(i)<=thsd&&cwth(i)>=-thsd)
        fixcounth=fixcounth+1;
        if(fixcounth>40)
           if(saccounth>4)
               sacstarth=[sacstarth;i-fixcounth-saccounth i-fixcounth];
           end
           saccounth=0;
           fixcounth=0;
        end
    end
end
plot(sacstarth(:,1),zeros(size(sacstarth,1),1),'o');
plot(sacstarth(:,2),zeros(size(sacstarth,1),1),'x');
%pbaspect([1.2 1 1])
for j=1:size(cwtv,2)
    if(cwtv(j)>thsd||cwtv(j)<-thsd)
        if(fixcountv>0)
            saccountv=saccountv+fixcountv;
            fixcountv=0;
        end
        saccountv=saccountv+1;
    elseif(cwtv(j)<=thsd&&cwtv(j)>=-thsd)
        fixcountv=fixcountv+1;
        if(fixcountv>40)
            if(saccountv>4)
                sacstartv=[sacstartv;j-fixcountv-saccountv j-fixcountv];
            end
            saccountv=0;
            fixcountv=0;
        end
    end
end
% plot(sacstartv(:,1),zeros(size(sacstartv,1),1),'o');
% plot(sacstartv(:,2),zeros(size(sacstartv,1),1),'x');

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