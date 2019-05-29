function y=abspdf(x,path,name,type,number,time)
    assert( ismatrix(x) );
    meanh=mean(x(:,1));
    meanv=mean(x(:,2));
    absh=abs(x(:,1)-meanh);
    absv=abs(x(:,2)-meanv);
    [f,xi]=ksdensity(absh);
    y=[f;xi];
    [f,xi]=ksdensity(absv);
    y=[y;f;xi];
    save(".\"+name+"\"+path+number+"\EOG"+name+type+number+"abspdf"+time+".mat",'y');
end