close all; clear;
subname=["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" ...
    "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"];
time="7s";
for name=subname
    path="EOG"+name+"street";
    type="street";
    for i=1:10
        load(".\"+name+"\"+path+i+"\EOG"+name+type+i+time+".mat");
        maxpdf(data7s,path,name,type,i,time);
        minpdf(data7s,path,name,type,i,time);
        deri1pdf(data7s,path,name,type,i,time);
        deri2pdf(data7s,path,name,type,i,time);
        abspdf(data7s,path,name,type,i,time);
        meanpdf(data7s,path,name,type,i,time);
        fixstartpdf(data7s,path,name,type,i,time);
        fixdurationpdf(data7s,path,name,type,i,time);
        fixcentroid(data7s,path,name,type,i,time);
        sacstartpdf(data7s,path,name,type,i,time);
        sacdurationpdf(data7s,path,name,type,i,time);
        sacamplitudepdf(data7s,path,name,type,i,time);
        blinkstartpdf(data7s,path,name,type,i,time);
        blinkdurationpdf(data7s,path,name,type,i,time);
        maxdistancepdf(data7s,path,name,type,i,time);
        mindistancepdf(data7s,path,name,type,i,time);
        slopeoppdf(data7s,path,name,type,i,time);
        slopeonpdf(data7s,path,name,type,i,time);
        slopefppdf(data7s,path,name,type,i,time);
        slopefnpdf(data7s,path,name,type,i,time);
        maxderipdf(data7s,path,name,type,i,time);
        minderipdf(data7s,path,name,type,i,time);
        maxderidistancepdf(data7s,path,name,type,i,time);
        minderidistancepdf(data7s,path,name,type,i,time);
    end
end

