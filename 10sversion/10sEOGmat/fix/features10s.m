close all; clear;
subname=["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" ...
    "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"];
time="10s";
for name=subname
    path="EOG"+name+"fix";
    type="fix";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+time+".mat");
        maxpdf(data10s,path,name,type,i,time);
        minpdf(data10s,path,name,type,i,time);
        deri1pdf(data10s,path,name,type,i,time);
        deri2pdf(data10s,path,name,type,i,time);
        abspdf(data10s,path,name,type,i,time);
        meanpdf(data10s,path,name,type,i,time);
        fixstartpdf(data10s,path,name,type,i,time);
        fixdurationpdf(data10s,path,name,type,i,time);
        fixcentroid(data10s,path,name,type,i,time);
        sacstartpdf(data10s,path,name,type,i,time);
        sacdurationpdf(data10s,path,name,type,i,time);
        sacamplitudepdf(data10s,path,name,type,i,time);
        blinkstartpdf(data10s,path,name,type,i,time);
        blinkdurationpdf(data10s,path,name,type,i,time);
        maxdistancepdf(data10s,path,name,type,i,time);
        mindistancepdf(data10s,path,name,type,i,time);
        slopeoppdf(data10s,path,name,type,i,time);
        slopeonpdf(data10s,path,name,type,i,time);
        slopefppdf(data10s,path,name,type,i,time);
        slopefnpdf(data10s,path,name,type,i,time);
        maxderipdf(data10s,path,name,type,i,time);
        minderipdf(data10s,path,name,type,i,time);
        maxderidistancepdf(data10s,path,name,type,i,time);
        minderidistancepdf(data10s,path,name,type,i,time);
    end
end

