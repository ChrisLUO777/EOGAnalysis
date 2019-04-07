function y=deri1pdf(x,path,name,type,number)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),1);
    derivv=diff(x(:,2),1);
    [f,xi]=ksdensity(derivh);
    y=[f;xi];
    [f,xi]=ksdensity(derivv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"deri1pdf.mat",'y');
end