subname=["Anh" "Luo" "Yi"];
for name=subname
    path="EOG"+name+"fix";
    type="fix";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+"20s.mat");
        maxpdf(data20s,path,name,type,i);
        minpdf(data20s,path,name,type,i);
        deri1pdf(data20s,path,name,type,i);
        deri2pdf(data20s,path,name,type,i);
        abspdf(data20s,path,name,type,i);
        meanpdf(data20s,path,name,type,i);
        fixstartpdf(data20s,path,name,type,i);
        fixdurationpdf(data20s,path,name,type,i);
        sacstartpdf(data20s,path,name,type,i);
        sacdurationpdf(data20s,path,name,type,i);
        sacamplitudepdf(data20s,path,name,type,i);
        blinkstartpdf(data20s,path,name,type,i);
        blinkdurationpdf(data20s,path,name,type,i);
    end
end

