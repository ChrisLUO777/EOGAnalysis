function y=meanpdf(x,path,name,type,number)
    assert( ismatrix(x) );
    meanh=x(:,1)-mean(x(:,1));
    meanv=x(:,2)-mean(x(:,2));
    [f,xi]=ksdensity(meanh);
    y=[f;xi];
    [f,xi]=ksdensity(meanv);
    y=[y;f;xi];
    save(".\"+path+number+"\EOG"+name+type+number+"meanpdf.mat",'y');
end