%new way to split data and process data into 10s, more convenient.
close all; clear;
subname=["48" "64"];
% subname=["17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36"...
%     "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"];
for name=subname
    load(".\"+name+"\EOG"+name+"street.mat");
    length=size(data,1);
    for i=1:10
        firstco=data((1+(length-2000)*(i-1)/9):(2000+(length-2000)*(i-1)/9),1);
        secondco=data((1+(length-2000)*(i-1)/9):(2000+(length-2000)*(i-1)/9),2);
        data10s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"street"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"street"+i+"\EOG"+name+"street"+i+"10s.mat",'data10s');
    end
end