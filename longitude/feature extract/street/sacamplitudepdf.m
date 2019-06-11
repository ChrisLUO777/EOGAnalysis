function y=sacamplitudepdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    sacamplitudeh=[];
    sacamplitudev=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(cwth,2)
        if(cwth(i)>thsd||cwth(i)<-thsd)
            saccounth=[saccounth;x(i,1)];
        elseif(cwth(i)<=thsd&&cwth(i)>=-thsd)
            if(size(saccounth,1)>4)
                sacamplitudeh=[sacamplitudeh;max(saccounth)-min(saccounth)];
            end
            saccounth=[];
        end
        
        if(cwtv(i)>thsd||cwtv(i)<-thsd)
            saccountv=[saccountv;x(i,2)];
        elseif(cwtv(i)<=thsd&&cwtv(i)>=-thsd)
            if(size(saccountv,1)>4)
                sacamplitudev=[sacamplitudev;max(saccountv)-min(saccountv)];
            end
            saccountv=[];
        end
    end
    if(size(sacamplitudeh,1)==0)
        sacamplitudeh=[0];
    end
    if(size(sacamplitudev,1)==0)
        sacamplitudev=[0];
    end
    [f,xi]=ksdensity(sacamplitudeh);
    y=[f;xi];
    [f,xi]=ksdensity(sacamplitudev);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"sacamplitudepdf"+time+".mat",'y');
end