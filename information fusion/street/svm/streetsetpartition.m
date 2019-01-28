load("EOGstreetwholeset.mat");
EOGstreettrainset=[];
EOGstreetcvset=[];
EOGstreettestset=[];
for i=0:18
    out=randperm(10);
    pick=out(1:4)+i*10;
    EOGstreetcvset=[EOGstreetcvset;EOGstreetwholeset(pick(1),:)];
    EOGstreetcvset=[EOGstreetcvset;EOGstreetwholeset(pick(2),:)];
    EOGstreettestset=[EOGstreettestset;EOGstreetwholeset(pick(3),:)];
    EOGstreettestset=[EOGstreettestset;EOGstreetwholeset(pick(4),:)];
    for j=5:10
        EOGstreettrainset=[EOGstreettrainset;EOGstreetwholeset(out(j)+i*10,:)];
    end
end
save("EOGstreettrainset.mat",'EOGstreettrainset');
save("EOGstreetcvset.mat",'EOGstreetcvset');
save("EOGstreettestset.mat",'EOGstreettestset');