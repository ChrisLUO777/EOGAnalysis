subname=['L' 'Y'];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"random"+i+".mat");
        firstco=data(1:4000,1);
        secondco=data(1:4000,2);
        data20s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"random20s\"+"EOG"+name+"random"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"random20s\"+"EOG"+name+"random"+i+"\EOG"+name+"random"+i+"20s.mat",'data20s');
    end
end