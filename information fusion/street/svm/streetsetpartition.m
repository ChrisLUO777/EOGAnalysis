load("EOGstreetwholeset.mat");
EOGstreettrainset=[];
EOGstreetcvset=[];
EOGstreettestset=[];
for i=0:86 %remember to change this part
    out=randperm(5);
    pick=out+i*5;
    EOGstreetcvset=[EOGstreetcvset;EOGstreetwholeset(pick(1),:)];
    EOGstreettestset=[EOGstreettestset;EOGstreetwholeset(pick(2),:)];
    for j=3:5
        EOGstreettrainset=[EOGstreettrainset;EOGstreetwholeset(out(j)+i*5,:)];
    end
end
save("EOGstreettrainset.mat",'EOGstreettrainset');
save("EOGstreetcvset.mat",'EOGstreetcvset');
save("EOGstreettestset.mat",'EOGstreettestset');