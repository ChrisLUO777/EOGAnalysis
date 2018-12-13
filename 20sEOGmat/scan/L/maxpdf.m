function y=maxpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    derivh=diff(x(:,1));
    maxh=[];
    derivv=diff(x(:,2));
    maxv=[];
    for i=1:size(derivh,1)
        if(derivh(i)==0&&x(i,1)>0)
            maxh=[maxh;x(i,1)];
        end
        if(derivv(i)==0&&x(i,2)>0)
            maxv=[maxv;x(i,2)];
        end
    end
    [f,xi]=ksdensity(maxh);
    y=[f;xi];
    [f,xi]=ksdensity(maxv);
    y=[y;f;xi];
    save(".\"+path+number+"\EOG"+name+type+number+"maxpdf.mat",'y');
end