subname=["Anh" "Luo" "Yi"];
threshold=0.01:0.001:0.05;
fscoreh=[];
fscorev=[];
for thsd=threshold
    TPh=0;
    FPh=0;
    TNh=0;
    FNh=0;
    TPv=0;
    FPv=0;
    TNv=0;
    FNv=0;
    for name=subname
    path="EOG"+name+"fix";
    type="fix";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"20s.mat");
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"groundtruthh.mat");
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"groundtruthv.mat");
        CWTcoeffsh = cwt(data20s(:,1),1:128,'haar');%haar tranform, scale=20
        CWTcoeffsv = cwt(data20s(:,2),1:128,'haar');
        cwth=CWTcoeffsh(20,:);
        cwtv=CWTcoeffsv(20,:);
        groundtruthh=[sacrangeh zeros(size(sacrangeh,1),1)];
        groundtruthv=[sacrangev zeros(size(sacrangev,1),1)];
        sacpredh=[];
        sacpredv=[];
        saccounth=0;
        saccountv=0;
        fixcounth=0;
        fixcountv=0;
        for m=1:size(cwth,2)
            if(cwth(m)>thsd||cwth(m)<-thsd)
                if(fixcounth>0)
                    saccounth=saccounth+fixcounth;
                    fixcounth=0;
                end
                saccounth=saccounth+1;
            elseif(cwth(m)<=thsd&&cwth(m)>=-thsd)
                fixcounth=fixcounth+1;
                if(fixcounth>40)
                    if(saccounth>4)
                        sacpredh=[sacpredh;m-fixcounth-saccounth m-fixcounth];
                    end
                    saccounth=0;
                    fixcounth=0;
                end
            end
        end
        
        for n=1:size(cwtv,2)
            if(cwtv(n)>thsd||cwtv(n)<-thsd)
                if(fixcountv>0)
                    saccountv=saccountv+fixcountv;
                    fixcountv=0;
                end
                saccountv=saccountv+1;
            elseif(cwtv(n)<=thsd&&cwtv(n)>=-thsd)
                fixcountv=fixcountv+1;
                if(fixcountv>40)
                    if(saccountv>4)
                        sacpredv=[sacpredv;n-fixcountv-saccountv n-fixcountv];
                    end
                    saccountv=0;
                    fixcountv=0;
                end
                
            end
        end
        sacpredh=[sacpredh zeros(size(sacpredh,1),1)];
        sacpredv=[sacpredv zeros(size(sacpredv,1),1)];
        
        for checkh=1:size(sacpredh,1)
            for truthh=1:size(groundtruthh,1)
                if(overlap(sacpredh(checkh,1),sacpredh(checkh,2),groundtruthh(truthh,1),groundtruthh(truthh,2)))
                    groundtruthh(truthh,3)=1;%a real saccade is found
                    sacpredh(checkh,3)=1;%a predict saccade is correct
                    break;
                end
            end
        end
        for checkv=1:size(sacpredv,1)
            for truthv=1:size(groundtruthv,1)
                if(overlap(sacpredv(checkv,1),sacpredv(checkv,2),groundtruthv(truthv,1),groundtruthv(truthv,2)))
                    groundtruthv(truthv,3)=1;%a real saccade is found
                    sacpredv(checkv,3)=1;%a predict saccade is correct
                    break;
                end
            end
        end
        
        if(size(sacpredh,1)>0)
            tempFPh=size(sacpredh,1)-sum(sacpredh(:,3));%FP=sum(pred=0)
        else
            tempFPh=0;
        end
        FPh=FPh+tempFPh;
        TNh=TNh+size(groundtruthh,1)-tempFPh;%TN=size(truth)-FP, fixations equals to saccades.
        
        tempTPh=sum(groundtruthh(:,3));%TP=sum(truth=1)
        TPh=TPh+tempTPh;
        FNh=FNh+size(groundtruthh,1)-tempTPh;%FN=size(truth)-TP
        
        if(size(sacpredv,1)>0)
            tempFPv=size(sacpredv,1)-sum(sacpredv(:,3));%FP=sum(pred=0)
        else
            tempFPv=0;
        end
        FPv=FPv+tempFPv;
        TNv=TNv+size(groundtruthv,1)-tempFPv;%TN=size(truth)-FP, fixations equals to saccades.
        
        tempTPv=sum(groundtruthv(:,3));%TP=sum(truth=1)
        TPv=TPv+tempTPv;
        FNv=FNv+size(groundtruthv,1)-tempTPv;%FN=size(truth)-TP
    end
    end
    precisionh=TPh/(TPh+FPh);
    recallh=TPh/(TPh+FNh);
    fscoreh=[fscoreh; 2*precisionh*recallh/(precisionh+recallh)];
    precisionv=TPv/(TPv+FPv);
    recallv=TPv/(TPv+FNv);
    fscorev=[fscorev; 2*precisionv*recallv/(precisionv+recallv)];
end
plot(threshold,fscoreh,'blue');
grid on;
hold on;
plot(threshold,fscorev,'red');
leg1 = legend('horizontal','vertical');
pbaspect([1.2 1 1])