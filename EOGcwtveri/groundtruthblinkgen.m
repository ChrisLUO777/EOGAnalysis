subname=["Anh" "Luo" "Yi"];
for name=subname
    path="EOG"+name+"fix";
    type="fix";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"20s.mat");
        %haar tranform, scale=20
        CWTcoeffsv = cwt(data20s(:,2),1:128,'haar');
        cwtv=CWTcoeffsv(20,:);
        thsd=0.04+0.02*rand(1);
        thsdt=70+30*rand(1);
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

        blinkstart=[];
        curpeak=[0 0];
        for n=1:size(sacpeakv,1)%each blink is a negative peak following a positive one
            if(sacpeakv(n,1)<0)
                curpeak(1,1)=sacpeakv(n,1);
                curpeak(1,2)=sacpeakv(n,2);
            elseif(sacpeakv(n,1)>0)
                if(curpeak(1,1)<0&&(sacpeakv(n,2)-curpeak(1,2))<thsdt)%following a positive peak, and within 500ms
                    blinkstart=[blinkstart;curpeak(1,2) sacpeakv(n,2)];
                end
                curpeak=[0 0];
            end
        end
                save(".\"+name+"\"+path+i+"\EOG"+name+type+i+"groundtruthb.mat",'blinkstart');
    end
end
