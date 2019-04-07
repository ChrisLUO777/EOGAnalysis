function y=fixcentroid(x,path,name,type,number)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    fixcentroidh=[];
    fixcentroidv=[];
    fixcounth=[];
    fixcountv=[];
    for i=1:size(cwth,2)
        if(cwth(i)<=thsd&&cwth(i)>=-thsd)
            fixcounth=[fixcounth;x(i,1)];
        elseif(cwth(i)>thsd||cwth(i)<-thsd)
            if(size(fixcounth,1)>4)
                fixcentroidh=[fixcentroidh;median(fixcounth)];
            end
            fixcounth=[];
        end
        
        if(cwtv(i)<=thsd&&cwtv(i)>=-thsd)
            fixcountv=[fixcountv;x(i,2)];
        elseif(cwtv(i)>thsd||cwtv(i)<-thsd)
            if(size(fixcountv,1)>4)
                fixcentroidv=[fixcentroidv;median(fixcountv)];
            end
            fixcountv=[];
        end
    end
    [f,xi]=ksdensity(fixcentroidh);
    y=[f;xi];
    [f,xi]=ksdensity(fixcentroidv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"fixcentroidpdf.mat",'y');
end