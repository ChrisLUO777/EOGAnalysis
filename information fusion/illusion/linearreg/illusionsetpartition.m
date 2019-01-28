load("EOGillusionwholeset.mat");
EOGillusiontrainset=[];
EOGillusioncvset=[];
EOGillusiontestset=[];
for i=0:18
    out=randperm(10);
    pick=out(1:4)+i*10;
    EOGillusioncvset=[EOGillusioncvset;EOGillusionwholeset(pick(1),:)];
    EOGillusioncvset=[EOGillusioncvset;EOGillusionwholeset(pick(2),:)];
    EOGillusiontestset=[EOGillusiontestset;EOGillusionwholeset(pick(3),:)];
    EOGillusiontestset=[EOGillusiontestset;EOGillusionwholeset(pick(4),:)];
    for j=5:10
        EOGillusiontrainset=[EOGillusiontrainset;EOGillusionwholeset(out(j)+i*10,:)];
    end
end
save("EOGillusiontrainset.mat",'EOGillusiontrainset');
save("EOGillusioncvset.mat",'EOGillusioncvset');
save("EOGillusiontestset.mat",'EOGillusiontestset');