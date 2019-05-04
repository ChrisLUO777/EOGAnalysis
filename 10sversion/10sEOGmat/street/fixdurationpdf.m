function y=fixdurationpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thfd=0.02;
    fixdurationh=[];
    fixdurationv=[];
    fixcounth=0;
    fixcountv=0;
    for i=1:size(cwth,2)
        if(cwth(i)<=thfd&&cwth(i)>=-thfd)
            fixcounth=fixcounth+1;
        elseif((cwth(i)>thfd||cwth(i)<-thfd))
            if(fixcounth>40)
                fixdurationh=[fixdurationh;fixcounth];
            end
            fixcounth=0;
        end
        
        if(cwtv(i)<=thfd&&cwtv(i)>=-thfd)
            fixcountv=fixcountv+1;
        elseif((cwtv(i)>thfd||cwtv(i)<-thfd))
            if(fixcountv>40)
                fixdurationv=[fixdurationv;fixcountv];
            end
            fixcountv=0;
        end
    end
    if(size(fixdurationh,1)==0)
        fixdurationh=[0];
    end
    if(size(fixdurationv,1)==0)
        fixdurationv=[0];
    end
    [f,xi]=ksdensity(fixdurationh);
    y=[f;xi];
    [f,xi]=ksdensity(fixdurationv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"fixdurationpdf.mat",'y');
end