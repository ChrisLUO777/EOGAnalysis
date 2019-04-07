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
    end
end

