path="EOGLscan";
name="L";
type="scan";
for i=1:10
    load(".\"+path+i+"\EOGL"+type+i+"20s.mat");
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
end


