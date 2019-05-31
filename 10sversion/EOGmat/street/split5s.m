%new way to split data and process data into 10s, more convenient.
close all; clear;
subname=["17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36"...
    "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"];
for name=subname
    load(".\"+name+"\EOG"+name+"street.mat");
    length=size(data,1);
    for i=1:10
        firstco=data((501+(length-2000)*(i-1)/9):(1500+(length-2000)*(i-1)/9),1);
        secondco=data((501+(length-2000)*(i-1)/9):(1500+(length-2000)*(i-1)/9),2);
        data5s=[firstco secondco];
        %mkdir(".\"+name+"\EOG"+name+"street"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"street"+i+"\EOG"+name+"street"+i+"5s.mat",'data5s');
    end
end