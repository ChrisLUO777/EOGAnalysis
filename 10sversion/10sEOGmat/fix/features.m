close all; clear;
subname=["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" ...
    "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" ...
    "56" "57" "58" "59" "60" "61" "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73" "74" "75" "76" "77" "78"];
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

