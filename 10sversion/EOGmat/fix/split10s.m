%new way to split data and process data into 10s, more convenient.
close all; clear;
subname=["61" "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73" "74" "75" "76" "77" "78"];
for name=subname
    load(".\"+name+"\EOG"+name+"fix.mat");
    length=size(data,1);
    for i=1:10
        firstco=data((length*i/11-999):(length*i/11+1000),1);
        secondco=data((length*i/11-999):(length*i/11+1000),2);
        data10s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"fix"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"fix"+i+"\EOG"+name+"fix"+i+"10s.mat",'data10s');
    end
end