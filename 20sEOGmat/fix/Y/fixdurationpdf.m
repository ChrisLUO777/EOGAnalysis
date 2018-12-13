function y=fixdurationpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),1);
    derivv=diff(x(:,2),1);
    eh=sort(derivh);
    ev=sort(derivv);
    thh=median(eh(eh<median(eh)));
    thv=median(ev(ev<median(ev)));
    fixdurationh=[];
    fixdurationv=[];
    fixcounth=0;
    fixcountv=0;
    for i=1:size(derivh,1)
        if(derivh(i)<=thh)
            fixcounth=fixcounth+1;
        else
            fixdurationh=[fixdurationh;fixcounth];
            fixcounth=0;
        end
        
        if(derivv(i)<=thv)
            fixcountv=fixcountv+1;
        else
            fixdurationv=[fixdurationv;fixcountv];
            fixcountv=0;
        end
    end
    [f,xi]=ksdensity(fixdurationh);
    y=[f;xi];
    [f,xi]=ksdensity(fixdurationv);
    y=[y;f;xi];
    save(".\"+path+number+"\EOG"+name+type+number+"fixdurationpdf.mat",'y');
end