subname=["Anh" "Luo" "Yi"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"street"+i+".mat");
        firstco=data(1:4000,1);
        secondco=data(1:4000,2);
        data20s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"street20s\"+"EOG"+name+"street"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"street20s\"+"EOG"+name+"street"+i+"\EOG"+name+"street"+i+"20s.mat",'data20s');
    end
end