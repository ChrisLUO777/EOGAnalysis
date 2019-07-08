close all; clear;
time="10s";
load("EOGillusiontrainset"+time+".mat");
load("EOGillusiontestset"+time+".mat");

d=EOGillusiontrainset(:,1:46);
f=EOGillusiontrainset(:,47);
K=46;
fea=mrmr_mid_d(d,f,K);
Fscore=0;

%%
%feature subsets
y=EOGillusiontrainset(:,47);
ytest=EOGillusiontestset(:,47);
Fscorelist=zeros(46,1);
for i=1:46
    bestfeature=fea(47-i:46);
    X=EOGillusiontrainset(:,bestfeature);
    Xtest=EOGillusiontestset(:,bestfeature);
    model=fitcsvm(X,y,'KernelFunction','poly');
    [label,score] = predict(model,Xtest);
    
    TP=0;
    FP=0;
    TN=0;
    FN=0;
    for j=1:size(ytest,1)
        if((label(j,1)==0) && (ytest(j,1)==0))%TP
                    TP=TP+1;
        elseif((label(j,1)==0) && (ytest(j,1)==1))%FP
                    FP=FP+1;
        elseif((label(j,1)==1) && (ytest(j,1)==1))%TN
                    TN=TN+1;
        elseif((label(j,1)==1) && (ytest(j,1)==0))%FN
                    FN=FN+1;
        end
    end
    precise=TP/(TP+FP);
    recall=TP/(TP+FN);
    %Fscore=2*precise*recall/(precise+recall);
    BAC=0.5*recall+0.5*TN/(TN+FP);
    Fscorelist(i,1)=BAC;
end