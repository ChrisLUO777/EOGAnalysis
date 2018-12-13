load("EOGrandomwholeset.mat");
EOGrandomtrainset=[];
EOGrandomcvset=[];
EOGrandomtestset=[];
for i=0:18
    out=randperm(10);
    pick=out(1:4)+i*10;
    EOGrandomcvset=[EOGrandomcvset;EOGrandomwholeset(pick(1),:)];
    EOGrandomcvset=[EOGrandomcvset;EOGrandomwholeset(pick(2),:)];
    EOGrandomtestset=[EOGrandomtestset;EOGrandomwholeset(pick(3),:)];
    EOGrandomtestset=[EOGrandomtestset;EOGrandomwholeset(pick(4),:)];
    for j=5:10
        EOGrandomtrainset=[EOGrandomtrainset;EOGrandomwholeset(out(j)+i*10,:)];
    end
end
save("EOGrandomtrainset.mat",'EOGrandomtrainset');
save("EOGrandomcvset.mat",'EOGrandomcvset');
save("EOGrandomtestset.mat",'EOGrandomtestset');