subname=["Anh" "Luo" "Yi"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"fix"+i+".mat");
        firstco=data(1:2000,1);
        secondco=data(1:2000,2);
        data10s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"fix10s\"+"EOG"+name+"fix"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"fix10s\"+"EOG"+name+"fix"+i+"\EOG"+name+"fix"+i+"10s.mat",'data10s');
    end
end