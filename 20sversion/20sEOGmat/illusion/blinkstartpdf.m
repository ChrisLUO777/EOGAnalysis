function y=blinkstartpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    sacpeakv=[];
    saccountv=[];
    for i=1:size(cwtv,2)
        if(cwtv(i)>thsd||cwtv(i)<-thsd)
           saccountv=[saccountv;cwtv(i)];
        elseif(cwtv(i)<=thsd&&cwtv(i)>=-thsd&&size(saccountv,1)>4)
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
    if(size(blinkstart,1)==0)
        blinkstart=[0];
    end
    [f,xi]=ksdensity(blinkstart);
    y=[f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"blinkstartpdf.mat",'y');
end