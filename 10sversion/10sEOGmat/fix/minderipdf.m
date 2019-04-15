function y=minderipdf(x,path,name,type,number)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),1);
    derivv=diff(x(:,2),1);
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    minderih=[];
    minderiv=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(derivh)
        if(cwth(i)<-thsd)
            saccounth=[saccounth;derivh(i,1)];
        elseif(cwth(i)>=-thsd)
            if(size(saccounth,1)>4)
                minderih=[minderih;min(saccounth)];
            end
            saccounth=[];
        end
        
        if(cwtv(i)<-thsd)
            saccountv=[saccountv;derivv(i,1)];
        elseif(cwtv(i)>=-thsd)
            if(size(saccountv,1)>4)
                minderiv=[minderiv;min(saccountv)];
            end
            saccountv=[];
        end
    end
    [f,xi]=ksdensity(minderih);
    y=[f;xi];
    [f,xi]=ksdensity(minderiv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"minderipdf.mat",'y');
end