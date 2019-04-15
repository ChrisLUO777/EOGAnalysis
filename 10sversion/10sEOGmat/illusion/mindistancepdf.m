function y=mindistancepdf(x,path,name,type,number)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    sacdistanceh=[];
    sacdistancev=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(cwth,2)
        if(cwth(i)<-thsd)
            saccounth=[saccounth;x(i,1)];
        elseif(cwth(i)>=-thsd)
            if(size(saccounth,1)>4)
                sacdistanceh=[sacdistanceh;find(saccounth==min(saccounth),1)];
            end
            saccounth=[];
        end
        
        if(cwtv(i)<-thsd)
            saccountv=[saccountv;x(i,2)];
        elseif(cwtv(i)>=-thsd)
            if(size(saccountv,1)>4)
                sacdistancev=[sacdistancev;find(saccountv==min(saccountv),1)];
            end
            saccountv=[];
        end
    end
    [f,xi]=ksdensity(sacdistanceh);
    y=[f;xi];
    [f,xi]=ksdensity(sacdistancev);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"mindistancepdf.mat",'y');
end