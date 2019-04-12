subname=["Anh" "Luo" "Yi"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"illusion"+i+".mat");
        firstco=data(1:2000,1);
        secondco=data(1:2000,2);
        data10s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"illusion10s\"+"EOG"+name+"illusion"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"illusion10s\"+"EOG"+name+"illusion"+i+"\EOG"+name+"illusion"+i+"10s.mat",'data10s');
    end
end