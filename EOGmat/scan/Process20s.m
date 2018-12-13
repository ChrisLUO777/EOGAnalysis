subname=['L' 'Y'];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"scan"+i+".mat");
        firstco=data(1:4000,1);
        secondco=data(1:4000,2);
        data20s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"scan20s\"+"EOG"+name+"scan"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"scan20s\"+"EOG"+name+"scan"+i+"\EOG"+name+"scan"+i+"20s.mat",'data20s');
    end
end