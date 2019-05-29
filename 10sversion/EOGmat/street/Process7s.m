close all; clear;
subname=["15" "16"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"street"+i+".mat");
        firstco=data(301:1700,1);
        secondco=data(301:1700,2);
        data7s=[firstco secondco];
        %mkdir(".\"+name+"\EOG"+name+"street"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"street"+i+"\EOG"+name+"street"+i+"7s.mat",'data7s');
    end
end