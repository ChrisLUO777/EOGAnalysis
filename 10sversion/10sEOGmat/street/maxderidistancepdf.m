function y=maxderidistancepdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),1);
    derivv=diff(x(:,2),1);
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    maxderidistanceh=[];
    maxderidistancev=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(derivh)
        if(cwth(i)>thsd)
            saccounth=[saccounth;derivh(i,1)];
        elseif(cwth(i)<=thsd)
            if(size(saccounth,1)>4)
                maxderidistanceh=[maxderidistanceh;find(saccounth==max(saccounth),1)];
            end
            saccounth=[];
        end
        
        if(cwtv(i)>thsd)
            saccountv=[saccountv;derivv(i,1)];
        elseif(cwtv(i)<=thsd)
            if(size(saccountv,1)>4)
                maxderidistancev=[maxderidistancev;find(saccountv==max(saccountv),1)];
            end
            saccountv=[];
        end
    end
    if(size(maxderidistanceh,1)==0)
        maxderidistanceh=[0];
    end
    if(size(maxderidistancev,1)==0)
        maxderidistancev=[0];
    end
    [f,xi]=ksdensity(maxderidistanceh);
    y=[f;xi];
    [f,xi]=ksdensity(maxderidistancev);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"maxderidistancepdf"+time+".mat",'y');
end