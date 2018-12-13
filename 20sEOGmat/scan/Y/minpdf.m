function y=minpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    derivh=diff(x(:,1));
    minh=[];
    derivv=diff(x(:,2));
    minv=[];
    for i=1:size(derivh,1)
        if(derivh(i)==0&&x(i,1)<0)
            minh=[minh;x(i,1)];
        end
        if(derivv(i)==0&&x(i,2)<0)
            minv=[minv;x(i,2)];
        end
    end
    [f,xi]=ksdensity(minh);
    y=[f;xi];
    [f,xi]=ksdensity(minv);
    y=[y;f;xi];
    save(".\"+path+number+"\EOG"+name+type+number+"minpdf.mat",'y');
end