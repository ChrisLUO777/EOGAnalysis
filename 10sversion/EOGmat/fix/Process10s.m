%old way to process records into 10s.
close all; clear;
subname=["28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"fix"+i+".mat");
        firstco=data(1:2000,1);
        secondco=data(1:2000,2);
        data10s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"fix"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"fix"+i+"\EOG"+name+"fix"+i+"10s.mat",'data10s');
    end
end