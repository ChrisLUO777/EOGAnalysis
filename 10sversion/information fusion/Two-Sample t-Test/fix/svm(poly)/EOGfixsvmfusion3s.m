close all; clear;
time="3s";
load("EOGfixtrainset"+time+".mat");
load("EOGfixtestset"+time+".mat");

%%
%train SVM
X=EOGfixtrainset(:,1:46);
y=EOGfixtrainset(:,47);
m = size(X, 1);
Xtest=EOGfixtestset(:,1:46);
ytest=EOGfixtestset(:,47);
mtest=size(Xtest,1);

model=fitcsvm(X,y,'KernelFunction','polynomial');
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
BAC=0.5*TP/(TP+FN)+0.5*TN/(TN+FP);
fprintf('TP=%f, FN=%f, FP=%f, TN=%f \n',TP,FN,FP,TN);
fprintf('Fscore=%f \n',Fscore);
fprintf('BAC=%f \n',BAC);
%%
%EER
% RN=sum(ytest);
% RP=size(ytest,1)-RN;
% 
% threshold=-5:0.0001:5;
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