function y=minderidistancepdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),1);
    derivv=diff(x(:,2),1);
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    minderidistanceh=[];
    minderidistancev=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(derivh)
        if(cwth(i)<-thsd)
            saccounth=[saccounth;derivh(i,1)];
        elseif(cwth(i)>=-thsd)
            if(size(saccounth,1)>4)
                minderidistanceh=[minderidistanceh;find(saccounth==min(saccounth),1)];
            end
            saccounth=[];
        end
        
        if(cwtv(i)<-thsd)
            saccountv=[saccountv;derivv(i,1)];
        elseif(cwtv(i)>=-thsd)
            if(size(saccountv,1)>4)
                minderidistancev=[minderidistancev;find(saccountv==min(saccountv),1)];
            end
            saccountv=[];
        end
    end
    if(size(minderidistanceh,1)==0)
        minderidistanceh=[0];
    end
    if(size(minderidistancev,1)==0)
        minderidistancev=[0];
    end
    [f,xi]=ksdensity(minderidistanceh);
    y=[f;xi];
    [f,xi]=ksdensity(minderidistancev);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"minderidistancepdf"+time+".mat",'y');
end