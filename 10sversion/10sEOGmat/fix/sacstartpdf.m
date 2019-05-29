function y=sacstartpdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    sacstarth=[];
    sacstartv=[];
    saccounth=0;
    saccountv=0;
    for i=1:size(cwth,2)
        if(cwth(i)>thsd||cwth(i)<-thsd)
           saccounth=saccounth+1;
        elseif(cwth(i)<=thsd&&cwth(i)>=-thsd)
           if(saccounth>4)
               sacstarth=[sacstarth;i-saccounth];
           end
           saccounth=0;
        end

        if(cwtv(i)>thsd||cwtv(i)<-thsd)
           saccountv=saccountv+1;
        elseif(cwtv(i)<=thsd&&cwtv(i)>=-thsd)
           if(saccountv>4)
               sacstartv=[sacstartv;i-saccountv];
           end
           saccountv=0;
        end
    end
    if(size(sacstarth,1)==0)
        sacstarth=[0];
    end
    if(size(sacstartv,1)==0)
        sacstartv=[0];
    end
    [f,xi]=ksdensity(sacstarth);
    y=[f;xi];
    [f,xi]=ksdensity(sacstartv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"sacstartpdf"+time+".mat",'y');
end