close all; clear;
subname=["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"street"+i+".mat");
        firstco=data(701:1300,1);
        secondco=data(701:1300,2);
        data3s=[firstco secondco];
        %mkdir(".\"+name+"\EOG"+name+"street"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"street"+i+"\EOG"+name+"street"+i+"3s.mat",'data3s');
    end
end