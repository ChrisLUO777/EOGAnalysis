function y=sacdurationpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),1);
    derivv=diff(x(:,2),1);
    eh=sort(derivh);
    ev=sort(derivv);
    thh=median(eh(eh<median(eh)));
    thv=median(ev(ev<median(ev)));
    sacdurationh=[];
    sacdurationv=[];
    saccounth=0;
    saccountv=0;
    for i=1:size(derivh,1)
        if(derivh(i)>thh)
            saccounth=saccounth+1;
        else
            sacdurationh=[sacdurationh;saccounth];
            saccounth=0;
        end
        
        if(derivv(i)>thv)
            saccountv=saccountv+1;
        else
            sacdurationv=[sacdurationv;saccountv];
            saccountv=0;
        end
    end
    [f,xi]=ksdensity(sacdurationh);
    y=[f;xi];
    [f,xi]=ksdensity(sacdurationv);
    y=[y;f;xi];
    save(".\"+path+number+"\EOG"+name+type+number+"sacdurationpdf.mat",'y');
end