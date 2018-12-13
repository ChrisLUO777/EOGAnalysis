load("EOGfixwholeset.mat");
EOGfixtrainset=[];
EOGfixcvset=[];
EOGfixtestset=[];
for i=0:18
    out=randperm(10);
    pick=out(1:4)+i*10;
    EOGfixcvset=[EOGfixcvset;EOGfixwholeset(pick(1),:)];
    EOGfixcvset=[EOGfixcvset;EOGfixwholeset(pick(2),:)];
    EOGfixtestset=[EOGfixtestset;EOGfixwholeset(pick(3),:)];
    EOGfixtestset=[EOGfixtestset;EOGfixwholeset(pick(4),:)];
    for j=5:10
        EOGfixtrainset=[EOGfixtrainset;EOGfixwholeset(out(j)+i*10,:)];
    end
end
save("EOGfixtrainset.mat",'EOGfixtrainset');
save("EOGfixcvset.mat",'EOGfixcvset');
save("EOGfixtestset.mat",'EOGfixtestset');