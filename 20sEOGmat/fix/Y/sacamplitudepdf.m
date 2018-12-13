function y=sacamplitudepdf(x,path,name,type,number)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),1);
    derivv=diff(x(:,2),1);
    eh=sort(derivh);
    ev=sort(derivv);
    thh=median(eh(eh<median(eh)));
    thv=median(ev(ev<median(ev)));
    sacamplitudeh=[];
    sacamplitudev=[];
    saccounth=[];
    saccountv=[];
    for i=1:size(derivh,1)
        if(derivh(i)>thh)
            saccounth=[saccounth;x(i,1)];
        else
            sacamplitudeh=[sacamplitudeh;max(saccounth)-min(saccounth)];
            saccounth=[];
        end
        
        if(derivv(i)>thv)
            saccountv=[saccountv;x(i,2)];
        else
            sacamplitudev=[sacamplitudev;max(saccountv)-min(saccountv)];
            saccountv=[];
        end
    end
    [f,xi]=ksdensity(sacamplitudeh);
    y=[f;xi];
    [f,xi]=ksdensity(sacamplitudev);
    y=[y;f;xi];
    save(".\"+path+number+"\EOG"+name+type+number+"sacamplitudepdf.mat",'y');
end