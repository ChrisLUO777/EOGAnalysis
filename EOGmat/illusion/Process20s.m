subname=["Anh" "Yi"];
for name=subname
    for i=1:10
        load(".\"+name+"\EOG"+name+"illusion"+i+".mat");
        firstco=data(1:4000,1);
        secondco=data(1:4000,2);
        data20s=[firstco secondco];
        mkdir(".\"+name+"\EOG"+name+"illusion20s\"+"EOG"+name+"illusion"+i);
        addpath(genpath(pwd));
        save(".\"+name+"\EOG"+name+"illusion20s\"+"EOG"+name+"illusion"+i+"\EOG"+name+"illusion"+i+"20s.mat",'data20s');
    end
end