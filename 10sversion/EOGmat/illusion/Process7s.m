close all; clear;
subname=["15" "16"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"illusion"+i+".mat");
        firstco=data(301:1700,1);
        secondco=data(301:1700,2);
        data7s=[firstco secondco];
        %mkdir(".\"+name+"\EOG"+name+"illusion"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"illusion"+i+"\EOG"+name+"illusion"+i+"7s.mat",'data7s');
    end
end