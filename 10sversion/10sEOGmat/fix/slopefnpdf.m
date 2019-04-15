function y=slopefnpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    slopefnh=[];
    slopefnv=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(cwth,2)
        if(cwth(i)<-thsd)
            saccounth=[saccounth;x(i,1)];
        elseif(cwth(i)>=-thsd)
            if(size(saccounth,1)>4)
                if((size(saccounth,1)-find(saccounth==min(saccounth),1))~=0)
                    slopefnh=[slopefnh;(-min(saccounth)/(size(saccounth,1)-find(saccounth==min(saccounth),1)))];
                end
            end
            saccounth=[];
        end
        
        if(cwtv(i)<-thsd)
            saccountv=[saccountv;x(i,2)];
        elseif(cwtv(i)>=-thsd)
            if(size(saccountv,1)>4)
                if((size(saccountv,1)-find(saccountv==min(saccountv),1))~=0)
                    slopefnv=[slopefnv;(-min(saccountv)/(size(saccountv,1)-find(saccountv==min(saccountv),1)))];
                end
            end
            saccountv=[];
        end
    end
    [f,xi]=ksdensity(slopefnh);
    y=[f;xi];
    [f,xi]=ksdensity(slopefnv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"slopefnpdf.mat",'y');
end