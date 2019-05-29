close all; clear;
subname=["15" "16"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"street"+i+".mat");
        firstco=data(501:1500,1);
        secondco=data(501:1500,2);
        data5s=[firstco secondco];
        %mkdir(".\"+name+"\EOG"+name+"street"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"street"+i+"\EOG"+name+"street"+i+"5s.mat",'data5s');
    end
end