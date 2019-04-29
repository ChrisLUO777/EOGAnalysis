load("EOGfixwholeset.mat");
EOGfixtrainset=[];
EOGfixcvset=[];
EOGfixtestset=[];
for i=0:2543  %remember to change this part
    out=randperm(5);
    pick=out+i*5;
    EOGfixcvset=[EOGfixcvset;EOGfixwholeset(pick(1),:)];
    EOGfixtestset=[EOGfixtestset;EOGfixwholeset(pick(2),:)];
    for j=3:5
        EOGfixtrainset=[EOGfixtrainset;EOGfixwholeset(out(j)+i*5,:)];
    end
end
save("EOGfixtrainset.mat",'EOGfixtrainset');
save("EOGfixcvset.mat",'EOGfixcvset');
save("EOGfixtestset.mat",'EOGfixtestset');