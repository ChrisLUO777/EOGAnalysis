subname=["Anh" "Luo" "Yi"];
for name=subname
    path="EOG"+name+"fix";
    type="fix";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"10s.mat");
        maxpdf(data10s,path,name,type,i);
        minpdf(data10s,path,name,type,i);
        deri1pdf(data10s,path,name,type,i);
        deri2pdf(data10s,path,name,type,i);
        abspdf(data10s,path,name,type,i);
        meanpdf(data10s,path,name,type,i);
        fixstartpdf(data10s,path,name,type,i);
        fixdurationpdf(data10s,path,name,type,i);
        fixcentroid(data10s,path,name,type,i);
        sacstartpdf(data10s,path,name,type,i);
        sacdurationpdf(data10s,path,name,type,i);
        sacamplitudepdf(data10s,path,name,type,i);
        blinkstartpdf(data10s,path,name,type,i);
        blinkdurationpdf(data10s,path,name,type,i);
        maxdistancepdf(data10s,path,name,type,i);
        mindistancepdf(data10s,path,name,type,i);
        slopeoppdf(data10s,path,name,type,i);
        slopeonpdf(data10s,path,name,type,i);
        slopefppdf(data10s,path,name,type,i);
        slopefnpdf(data10s,path,name,type,i);
        maxderipdf(data10s,path,name,type,i);
        minderipdf(data10s,path,name,type,i);
        maxderidistancepdf(data10s,path,name,type,i);
        minderidistancepdf(data10s,path,name,type,i);
    end
end

