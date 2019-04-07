load("EOGillusionwholeset.mat");
EOGillusiontrainset=[];
EOGillusioncvset=[];
EOGillusiontestset=[];
for i=0:86 %remember to change this part
    out=randperm(5);
    pick=out+i*5;
    EOGillusioncvset=[EOGillusioncvset;EOGillusionwholeset(pick(1),:)];
    EOGillusiontestset=[EOGillusiontestset;EOGillusionwholeset(pick(2),:)];
    for j=3:5
        EOGillusiontrainset=[EOGillusiontrainset;EOGillusionwholeset(out(j)+i*5,:)];
    end
end
save("EOGillusiontrainset.mat",'EOGillusiontrainset');
save("EOGillusioncvset.mat",'EOGillusioncvset');
save("EOGillusiontestset.mat",'EOGillusiontestset');