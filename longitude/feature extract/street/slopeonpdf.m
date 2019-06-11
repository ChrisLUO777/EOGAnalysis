function y=slopeonpdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    slopeonh=[];
    slopeonv=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(cwth,2)
        if(cwth(i)<-thsd)
            saccounth=[saccounth;x(i,1)];
        elseif(cwth(i)>=-thsd)
            if(size(saccounth,1)>4)
                slopeonh=[slopeonh;(min(saccounth)/find(saccounth==min(saccounth),1))];
            end
            saccounth=[];
        end
        
        if(cwtv(i)<-thsd)
            saccountv=[saccountv;x(i,2)];
        elseif(cwtv(i)>=-thsd)
            if(size(saccountv,1)>4)
                slopeonv=[slopeonv;(min(saccountv)/find(saccountv==min(saccountv),1))];
            end
            saccountv=[];
        end
    end
    if(size(slopeonh,1)==0)
        slopeonh=[0];
    end
    if(size(slopeonv,1)==0)
        slopeonv=[0];
    end
    [f,xi]=ksdensity(slopeonh);
    y=[f;xi];
    [f,xi]=ksdensity(slopeonv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"slopeonpdf"+time+".mat",'y');
end