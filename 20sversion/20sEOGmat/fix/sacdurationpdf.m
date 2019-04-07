function y=sacdurationpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    CWTcoeffsh = cwt(x(:,1),1:128,'haar');
    CWTcoeffsv = cwt(x(:,2),1:128,'haar');
    cwth=CWTcoeffsh(20,:);
    cwtv=CWTcoeffsv(20,:);
    thsd=0.02;
    sacdurationh=[];
    sacdurationv=[];
    saccounth=0;
    saccountv=0;
    for i=1:size(cwth,2)
        if(cwth(i)>thsd||cwth(i)<-thsd)
            saccounth=saccounth+1;
        elseif(cwth(i)<=thsd&&cwth(i)>=-thsd)
            if(saccounth>4)
                sacdurationh=[sacdurationh;saccounth];
            end
            saccounth=0;
        end
        
        if(cwtv(i)>thsd||cwtv(i)<-thsd)
            saccountv=saccountv+1;
        elseif(cwtv(i)<=thsd&&cwtv(i)>=-thsd)
            if(saccountv>4)
                sacdurationv=[sacdurationv;saccountv];
            end
            saccountv=0;
        end
    end
    [f,xi]=ksdensity(sacdurationh);
    y=[f;xi];
    [f,xi]=ksdensity(sacdurationv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"sacdurationpdf.mat",'y');
end