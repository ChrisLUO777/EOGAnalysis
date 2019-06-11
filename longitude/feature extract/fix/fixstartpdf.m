function y=fixstartpdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thfd=0.02;
    fixstarth=[];
    fixstartv=[];
    fixcounth=0;
    fixcountv=0;
    for i=1:size(cwth,2)
        if(cwth(i)<=thfd&&cwth(i)>=-thfd)
            fixcounth=fixcounth+1;
        elseif((cwth(i)>thfd||cwth(i)<-thfd))
            if(fixcounth>40)
               fixstarth=[fixstarth;i-fixcounth];
            end
            fixcounth=0;
        end
        
        if(cwtv(i)<=thfd&&cwtv(i)>=-thfd)
            fixcountv=fixcountv+1;
        elseif((cwtv(i)>thfd||cwtv(i)<-thfd))
            if(fixcountv>40)
                fixstartv=[fixstartv;i-fixcountv];
            end
            fixcountv=0;
        end
    end
    if(size(fixstarth,1)==0)
        fixstarth=[0];
    end
    if(size(fixstartv,1)==0)
        fixstartv=[0];
    end
    [f,xi]=ksdensity(fixstarth);
    y=[f;xi];
    [f,xi]=ksdensity(fixstartv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"fixstartpdf"+time+".mat",'y');
end