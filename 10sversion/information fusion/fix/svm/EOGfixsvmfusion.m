close all; clear;
load("EOGfixtrainset.mat");
load("EOGfixcvset.mat");
load("EOGfixtestset.mat");

d=EOGfixtrainset(:,1:46);
f=EOGfixtrainset(:,47);
K=46;
fea=mrmr_mid_d(d,f,K);
Fscore=0;
bestfeature=[1:46];
mRMREER=1;
%%
%mRMR
for count=2:46
    X=EOGfixtrainset(:,fea(1:count));
    y=EOGfixtrainset(:,47);

    Xval=EOGfixcvset(:,fea(1:count));
    yval=EOGfixcvset(:,47);

    Xtest=EOGfixtestset(:,fea(1:count));
    ytest=EOGfixtestset(:,47);

    
    %svm
    model=fitcsvm(X,y,'KernelFunction','gaussian');
    [~,score] = predict(model,Xtest);

    %mRMR(EER)
    tempEER=EER(ytest,score);
    if tempEER<mRMREER
       mRMREER=tempEER;
       bestfeature=fea(1:count);
    end
end
%%
%train SVM
X=EOGfixtrainset(:,bestfeature);
y=EOGfixtrainset(:,47);
m = size(X, 1);
Xval=EOGfixcvset(:,bestfeature);
yval=EOGfixcvset(:,47);
mval=size(Xval,1);
Xtest=EOGfixtestset(:,bestfeature);
ytest=EOGfixtestset(:,47);
mtest=size(Xtest,1);

model=fitcsvm(X,y,'KernelFunction','gaussian');
[label,score] = predict(model,Xtest);
%%
%EER
RN=sum(ytest);
RP=size(ytest,1)-RN;

threshold=-5:0.00001:5;
TPR=zeros(1,size(threshold,2));
FPR=zeros(1,size(threshold,2));
count=1;
for k=threshold
    TP=0;
    FP=0;
    for i=1:size(ytest,1)
        if((score(i,2)<k) && (ytest(i,1)==0))%TP
                TP=TP+1;
        elseif((score(i,2)<k) && (ytest(i,1)==1))%FP
                FP=FP+1;
        end
    end
    TPR(1,count)=(TP/RP);
    FPR(1,count)=(FP/RN);
    count=count+1;
end

plot(FPR,TPR);
hold on;
plot(FPR,TPR,'o');
plot(0:0.01:1,1:-0.01:0,'r');
grid on;
xlabel('False Positive Rate');
ylabel('True Positive Rate');
axis([0 1 0 1]);

fprintf('Program paused. Press enter to continue.\n');
pause;

%%
%F score
close all;

threshold=-5:0.00001:5;
Fscore=zeros(1,size(threshold,2));
count=1;
for k=threshold
    TP=0;
    FP=0;
    FN=0;
    for i=1:size(ytest,1)
        if((score(i,2)<k) && (ytest(i,1)==0))%TP
                TP=TP+1;
        elseif((score(i,2)<k) && (ytest(i,1)==1))%FP
                FP=FP+1;
        elseif((score(i,2)>k) && (ytest(i,1)==0))%FN
                FN=FN+1;        
        end
    end
    precise=TP/(TP+FP);
    recall=TP/(TP+FN);
    Fscore(1,count)=2*precise*recall/(precise+recall);
    count=count+1;
end

plot(threshold,Fscore);
hold on;
plot(threshold,Fscore,'.');
grid on;
xlabel('threshold');
ylabel('fscore');
axis([0 1 0 1]);