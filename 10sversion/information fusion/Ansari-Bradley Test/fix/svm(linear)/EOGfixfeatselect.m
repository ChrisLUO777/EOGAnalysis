close all; clear;
time="10s";
load("EOGfixtrainset"+time+".mat");
load("EOGfixtestset"+time+".mat");
subsetfeature=[1 2 23 24 31 32 33 34 35 36 37 38];
%%
%train SVM
X=EOGfixtrainset(:,subsetfeature);
y=EOGfixtrainset(:,47);
m = size(X, 1);
Xtest=EOGfixtestset(:,subsetfeature);
ytest=EOGfixtestset(:,47);
mtest=size(Xtest,1);

model=fitcsvm(X,y,'KernelFunction','linear');
[label,score] = predict(model,Xtest);
% fun=@(XT,yT,Xt,yt)(sum(yt~=classify(Xt,XT,yT)));
% [inmodel,history]=sequentialfs(fun,X,y,'direction','backward');
%%
%confusion matrix
TP=0;
FP=0;
TN=0;
FN=0;
for i=1:size(ytest,1)
    if((label(i,1)==0) && (ytest(i,1)==0))%TP
                TP=TP+1;
    elseif((label(i,1)==0) && (ytest(i,1)==1))%FP
                FP=FP+1;
    elseif((label(i,1)==1) && (ytest(i,1)==1))%TN
                TN=TN+1;
    elseif((label(i,1)==1) && (ytest(i,1)==0))%FN
                FN=FN+1;
    end
end
precise=TP/(TP+FP);
recall=TP/(TP+FN);
Fscore=2*precise*recall/(precise+recall);
fprintf('TP=%f, FN=%f, FP=%f, TN=%f \n',TP,FN,FP,TN);
fprintf('Fscore=%f \n',Fscore);