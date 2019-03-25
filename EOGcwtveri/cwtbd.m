subname=["Anh" "Luo" "Yi"];
threshold=0.01:0.001:0.08;

fscoreb=[];
for thsd=threshold
    
    TPb=0;
    FPb=0;
    TNb=0;
    FNb=0;
    for name=subname
    path="EOG"+name+"fix";
    type="fix";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"20s.mat");
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"groundtruthb.mat");
        %haar tranform, scale=20
        CWTcoeffsv = cwt(data20s(:,2),1:128,'haar');
        cwtv=CWTcoeffsv(20,:);
        groundtruthb=[blinkstart zeros(size(blinkstart,1),1)];
        sacpeakv=[];
        saccountv=[];
        
        
        for m=1:size(cwtv,2)
            if(cwtv(m)>thsd||cwtv(m)<-thsd)
               saccountv=[saccountv;cwtv(m)];
            elseif(cwtv(m)<=thsd&&cwtv(m)>=-thsd)
               if(max(saccountv)>0)
                   loc=(m-size(saccountv,1)-1+find(saccountv==max(saccountv),1));
                   sacpeakv=[sacpeakv;max(saccountv) loc];
               elseif(min(saccountv)<0)
                   loc=(m-size(saccountv,1)-1+find(saccountv==min(saccountv),1));
                   sacpeakv=[sacpeakv;min(saccountv) loc];
               end
               saccountv=[];
            end
        end

        blinkpred=[];
        curpeak=[0 0];
        for n=1:size(sacpeakv,1)%each blink is a negative peak following a positive one
            if(sacpeakv(n,1)<0)
                curpeak(1,1)=sacpeakv(n,1);
                curpeak(1,2)=sacpeakv(n,2);
            elseif(sacpeakv(n,1)>0)
                if(curpeak(1,1)<0&&(sacpeakv(n,2)-curpeak(1,2))<100)%following a positive peak, and within 500ms
                    blinkpred=[blinkpred;curpeak(1,2) sacpeakv(n,2)];
                end
                curpeak=[0 0];
            end
        end

        blinkpred=[blinkpred zeros(size(blinkpred,1),1)];
        
      
        for checkb=1:size(blinkpred,1)
            for truthb=1:size(groundtruthb,1)
                if(overlap(blinkpred(checkb,1),blinkpred(checkb,2),groundtruthb(truthb,1),groundtruthb(truthb,2)))
                    groundtruthb(truthb,3)=1;%a real saccade is found
                    blinkpred(checkb,3)=1;%a predict saccade is correct
                    break;
                end
            end
        end
        
        
        if(size(blinkpred,1)>0)
            tempFPb=size(blinkpred,1)-sum(blinkpred(:,3));%FP=sum(pred=0)
        else
            tempFPb=0;
        end
        FPb=FPb+tempFPb;
        TNb=TNb+size(groundtruthb,1)-tempFPb;%TN=size(truth)-FP, fixations equals to saccades.
        
        tempTPb=sum(groundtruthb(:,3));%TP=sum(truth=1)
        TPb=TPb+tempTPb;
        FNb=FNb+size(groundtruthb,1)-tempTPb;%FN=size(truth)-TP
    end
    end
    
    precisionb=TPb/(TPb+FPb);
    recallb=TPb/(TPb+FNb);
    fscoreb=[fscoreb; 2*precisionb*recallb/(precisionb+recallb)];
end

plot(threshold,fscoreb,'blue');
grid on;
hold on;
leg1 = legend('100 ms');
pbaspect([1.2 1 1])