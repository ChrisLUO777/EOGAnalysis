subname=["Anh" "Luo" "Yi"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"street"+i+".mat");
        firstco=data(1:2000,1);
        secondco=data(1:2000,2);
        data10s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"street10s\"+"EOG"+name+"street"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"street10s\"+"EOG"+name+"street"+i+"\EOG"+name+"street"+i+"10s.mat",'data10s');
    end
end