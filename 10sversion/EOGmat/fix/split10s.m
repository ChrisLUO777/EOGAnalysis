%new way to split data and process data into 10s, more convenient.
close all; clear;
subname=["41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" ...
    "61" "62" "63" "64"];
for name=subname
    load(".\"+name+"\EOG"+name+"fix.mat");
    length=size(data,1);
    for i=1:10
        firstco=data((1+(length-2000)*(i-1)/9):(2000+(length-2000)*(i-1)/9),1);
        secondco=data((1+(length-2000)*(i-1)/9):(2000+(length-2000)*(i-1)/9),2);
        data10s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"fix"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"fix"+i+"\EOG"+name+"fix"+i+"10s.mat",'data10s');
    end
end