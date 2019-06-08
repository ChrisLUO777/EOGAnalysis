close all; clear;
load("EOGfixtrainset.mat");
load("EOGfixtestset.mat");

d=EOGfixtrainset(:,1:46);
f=EOGfixtrainset(:,47);
K=46;
fea=mrmr_mid_d(d,f,K);
bestfeature=[1:46];
mRMRfscore=0;
%%
% %mRMR
% for count=2:46
%     X=EOGfixtrainset(:,fea(1:count));
%     y=EOGfixtrainset(:,47);
% 
%     Xtest=EOGfixtestset(:,fea(1:count));
%     ytest=EOGfixtestset(:,47);
% 
%     %svm
%     model=fitcsvm(X,y,'KernelFunction','gaussian');
%     [label,~] = predict(model,Xtest);
% 
%     %mRMR(Fscore)
%     TP=0;
%     FP=0;
%     FN=0;
%     for i=1:size(ytest,1)
%         if((label(i,1)==0) && (ytest(i,1)==0))%TP
%                 TP=TP+1;
%         elseif((label(i,1)==0) && (ytest(i,1)==1))%FP
%                 FP=FP+1;
%         elseif((label(i,1)==1) && (ytest(i,1)==0))%FN
%                 FN=FN+1;        
%         end
%     end
%     precise=TP/(TP+FP);
%     recall=TP/(TP+FN);
%     tempFscore=2*precise*recall/(precise+recall);
%     if tempFscore>mRMRfscore
%        mRMRfscore=tempFscore;
%        bestfeature=fea(1:count);
%     end
% end
%%
%train SVM
X=EOGfixtrainset(:,bestfeature);
y=EOGfixtrainset(:,47);
m = size(X, 1);
Xtest=EOGfixtestset(:,bestfeature);
ytest=EOGfixtestset(:,47);
mtest=size(Xtest,1);

model=fitcsvm(X,y,'KernelFunction','gaussian');
[label,score] = predict(model,Xtest);
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
%%
%EER
% RN=sum(ytest);
% RP=size(ytest,1)-RN;
% 
% threshold=-5:0.00001:5;
% TPR=zeros(1,size(threshold,2));
% FPR=zeros(1,size(threshold,2));
% count=1;
% bestth=0;
% for k=threshold
%     TP=0;
%     FP=0;
%     for i=1:size(ytest,1)
%         if((score(i,2)<k) && (ytest(i,1)==0))%TP
%                 TP=TP+1;
%         elseif((score(i,2)<k) && (ytest(i,1)==1))%FP
%                 FP=FP+1;
%         end
%     end
%     TPR(1,count)=(TP/RP);
%     FPR(1,count)=(FP/RN);
%     if TPR(1,count)<=(1-FPR(1,count))
%        bestth=k;
%     end
%     count=count+1;
% end
% 
% plot(FPR,TPR);
% hold on;
% plot(FPR,TPR,'.');
% plot(0:0.01:1,1:-0.01:0,'r');
% grid on;
% xlabel('False Positive Rate');
% ylabel('True Positive Rate');
% axis([0 1 0 1]);