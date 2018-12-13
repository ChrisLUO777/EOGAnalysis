function y=sacamplitudepdf(x,path,name,type,number)
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
        elseif(cwth(i)<=thsd&&cwth(i)>=-thsd&&size(saccounth,1)>4)
            sacamplitudeh=[sacamplitudeh;max(saccounth)-min(saccounth)];
            saccounth=[];
        end
        
        if(cwtv(i)>thsd||cwtv(i)<-thsd)
            saccountv=[saccountv;x(i,2)];
        elseif(cwtv(i)<=thsd&&cwtv(i)>=-thsd&&size(saccountv,1)>4)
            sacamplitudev=[sacamplitudev;max(saccountv)-min(saccountv)];
            saccountv=[];
        end
    end
    [f,xi]=ksdensity(sacamplitudeh);
    y=[f;xi];
    [f,xi]=ksdensity(sacamplitudev);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"sacamplitudepdf.mat",'y');
end