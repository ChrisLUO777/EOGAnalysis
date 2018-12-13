load("EOGscanwholeset.mat");
EOGscantrainset=[];
EOGscancvset=[];
EOGscantestset=[];
for i=0:18
    out=randperm(10);
    pick=out(1:4)+i*10;
    EOGscancvset=[EOGscancvset;EOGscanwholeset(pick(1),:)];
    EOGscancvset=[EOGscancvset;EOGscanwholeset(pick(2),:)];
    EOGscantestset=[EOGscantestset;EOGscanwholeset(pick(3),:)];
    EOGscantestset=[EOGscantestset;EOGscanwholeset(pick(4),:)];
    for j=5:10
        EOGscantrainset=[EOGscantrainset;EOGscanwholeset(out(j)+i*10,:)];
    end
end
save("EOGscantrainset.mat",'EOGscantrainset');
save("EOGscancvset.mat",'EOGscancvset');
save("EOGscantestset.mat",'EOGscantestset');