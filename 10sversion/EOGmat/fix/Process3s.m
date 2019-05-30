%old way to process records into 3s.
close all; clear;
subname=["01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"fix"+i+".mat");
        firstco=data(701:1300,1);
        secondco=data(701:1300,2);
        data3s=[firstco secondco];
        %mkdir(".\"+name+"\EOG"+name+"fix"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"fix"+i+"\EOG"+name+"fix"+i+"3s.mat",'data3s');
    end
end