function y=slopefppdf(x,path,name,type,number)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    slopefph=[];
    slopefpv=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(cwth,2)
        if(cwth(i)>thsd)
            saccounth=[saccounth;x(i,1)];
        elseif(cwth(i)<=thsd)
            if(size(saccounth,1)>4)
                if((size(saccounth,1)-find(saccounth==max(saccounth),1))~=0)
                    slopefph=[slopefph;(-max(saccounth)/(size(saccounth,1)-find(saccounth==max(saccounth),1)))];
                end
            end
            saccounth=[];
        end
        
        if(cwtv(i)>thsd)
            saccountv=[saccountv;x(i,2)];
        elseif(cwtv(i)<=thsd)
            if(size(saccountv,1)>4)
                if((size(saccountv,1)-find(saccountv==max(saccountv),1))~=0)
                    slopefpv=[slopefpv;(-max(saccountv)/(size(saccountv,1)-find(saccountv==max(saccountv),1)))];
                end
            end
            saccountv=[];
        end
    end
    [f,xi]=ksdensity(slopefph);
    y=[f;xi];
    [f,xi]=ksdensity(slopefpv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"slopefppdf.mat",'y');
end