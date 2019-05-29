function y=deri2pdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    derivh=diff(x(:,1),2);
    derivv=diff(x(:,2),2);
    [f,xi]=ksdensity(derivh);
    y=[f;xi];
    [f,xi]=ksdensity(derivv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"deri2pdf"+time+".mat",'y');
end