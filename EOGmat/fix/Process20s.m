subname=['L' 'Y'];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"fix"+i+".mat");
        firstco=data(1:4000,1);
        secondco=data(1:4000,2);
        data20s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"fix20s\"+"EOG"+name+"fix"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"fix20s\"+"EOG"+name+"fix"+i+"\EOG"+name+"fix"+i+"20s.mat",'data20s');
    end
end